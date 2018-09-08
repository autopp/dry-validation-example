require 'dry-validation'

describe 'dry-validation' do
  subject { schema.call(input).messages }

  shared_context 'pending', pending: true do
    before { pending }
  end

  shared_examples :no_errors do
    it { is_expected.to eq({}) }
  end

  describe 'symbol hash schema' do
    let(:schema) do
      Dry::Validation.Schema do
        required(:name) { str? }
        required(:age) { int? }
      end
    end

    context 'with symbol hash' do
      let(:input) { { name: 'foo', age: 18 } }

      it_behaves_like :no_errors
    end

    context 'with empty hash', pending: true do
      let(:input) { {} }

      it_behaves_like :no_errors
    end

    context 'with string hash', pending: true do
      let(:input) { { 'name' => 'foo', 'age' => 18 } }

      it_behaves_like :no_errors
    end
  end

  describe 'string hash schema' do
    let(:schema) do
      Dry::Validation.Schema do
        required('name') { str? }
        required('age') { int? }
      end
    end

    context 'with string hash' do
      let(:input) { { 'name' => 'foo', 'age' => 18 } }

      it_behaves_like :no_errors
    end

    context 'with symbol hash', pending: true do
      let(:input) { { name: 'foo', age: 18 } }

      it_behaves_like :no_errors
    end
  end
end
