Return-Path: <linux-i2c+bounces-14932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F00CFAD28
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 20:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4160631CE523
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 19:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F22E312814;
	Tue,  6 Jan 2026 19:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLgmWB3q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F79028DB49;
	Tue,  6 Jan 2026 19:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767727118; cv=none; b=JWqAaicrGT7rjofMWhlkwpKHtXF2npizzEDNOCWRF3zlhMLmch4H9mNlemZsO6adrr5ClLpqf5Lr1cMuM/cWOJ3hVoFyrERjOYIkx8Lzo3yGMGUHmj89Q4m1dseDJAi7LtSK4efGtamiZNm3KN5f3xjB9SEEzpotn4MXE58IWIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767727118; c=relaxed/simple;
	bh=SQY9xpLgnO1b7WXa0sl9VjJty77jql7OKhPWuUhR7sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A04Sk3mpuxQbVnODli6KRrikqSQOPmlSl0IPzyZWDWrXXpasfh6btQW8jciCpfa0BPRBw15dwT0MGbd1jGYnVTHxw9mzCrvWuresLHpm7++WTRGFpyrX4lzjkGeJTuoZTOavtKh9oyhqpleA05/WGiEJF7xs3QZ74jiPKdKDb7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLgmWB3q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46344C116C6;
	Tue,  6 Jan 2026 19:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767727117;
	bh=SQY9xpLgnO1b7WXa0sl9VjJty77jql7OKhPWuUhR7sk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DLgmWB3q/2Um4yp1nL6ZNmKVnw2XjKzg9o+MZBLRHr1v9ndZEfSZkllxOZzCCO7jp
	 XENOgY/JpDKKXhOIWt8qRdBAMrg8To8s4M6mecjSwQjgMZZ1N/52hT2qvAHiWm3OFy
	 IUnJh5fKdlfC28UJYcxiw23D2Y9tuARXwE9AMcd4jmpGG0hTYffp+7Pj/ikrXMt60n
	 +QL8EHOIKLM/TfMme0TrNp8P8Wdc6EayNuuUlq6dF7ITx+mtufyvSv3npcCcpx7mCX
	 h/8z25leHj6TzD9b1P8cgvIBsLL4rt3kOyu32FT+kIuCZ/+/06u3Bht9T//szuY/CJ
	 iyrrYmzrRGb8w==
Message-ID: <a228d38d-9fb9-4e61-9a02-e70593c69dac@kernel.org>
Date: Tue, 6 Jan 2026 20:18:32 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Add support for camss
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-7-646fee2eb720@oss.qualcomm.com>
 <20251127-steadfast-red-koel-8c9bc8@kuoka>
 <6aa8ffc4-2fe5-44ad-8ac8-581e0697360f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <6aa8ffc4-2fe5-44ad-8ac8-581e0697360f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/01/2026 19:40, Vijay Kumar Tumati wrote:
> 
> On 11/27/2025 12:12 AM, Krzysztof Kozlowski wrote:
>> On Wed, Nov 26, 2025 at 01:38:40AM -0800, Hangxiang Ma wrote:
>>   +
>>> +			cci1_1_default: cci1-1-default-state {
>>> +				sda-pins {
>>> +					pins = "gpio111";
>>> +					function = "cci_i2c_sda";
>>> +					drive-strength = <2>;
>>> +					bias-pull-up;
>>> +				};
>>> +
>>> +				scl-pins {
>>> +					pins = "gpio164";
>>> +					function = "cci_i2c_scl";
>>> +					drive-strength = <2>;
>>> +					bias-pull-up;
>>> +				};
>>> +			};
>>> +
>>> +			cci1_1_sleep: cci1-1-sleep-state {
>>> +				sda-pins {
>>> +					pins = "gpio111";
>>> +					function = "cci_i2c_sda";
>>> +					drive-strength = <2>;
>>> +					bias-pull-down;
>>> +				};
>>> +
>>> +				scl-pins {
>>> +					pins = "gpio164";
>>> +					function = "cci_i2c_scl";
>>> +					drive-strength = <2>;
>>> +					bias-pull-down;
>>> +				};
>>> +			};
>>> +
>>> +			cci2_0_default: cci2-0-default-state {
>>> +				sda-pins {
>>> +					pins = "gpio112";
>>> +					function = "cci_i2c_sda";
>>> +					drive-strength = <2>;
>>> +					bias-pull-up;
>>> +				};
>>> +
>>> +				scl-pins {
>>> +					pins = "gpio153";
>>> +					function = "cci_i2c_scl";
>>> +					drive-strength = <2>;
>>> +					bias-pull-up;
>>> +				};
>>> +			};
>>> +
>>> +			cci2_0_sleep: cci2-0-sleep-state {
>>> +				sda-pins {
>>> +					pins = "gpio112";
>>> +					function = "cci_i2c_sda";
>>> +					drive-strength = <2>;
>>> +					bias-pull-down;
>>> +				};
>>> +
>>> +				scl-pins {
>>> +					pins = "gpio153";
>>> +					function = "cci_i2c_scl";
>>> +					drive-strength = <2>;
>>> +					bias-pull-down;
>>> +				};
>>> +			};
>>> +
>>> +			cci2_1_default: cci2-1-default-state {
>>> +				sda-pins {
>>> +					pins = "gpio119";
>>> +					function = "cci_i2c_sda";
>>> +					drive-strength = <2>;
>>> +					bias-pull-up;
>>> +				};
>>> +
>>> +				scl-pins {
>>> +					pins = "gpio120";
>>> +					function = "cci_i2c_scl";
>>> +					drive-strength = <2>;
>>> +					bias-pull-up;
>>> +				};
>>> +			};
>>> +
>>> +			cci2_1_sleep: cci2-1-sleep-state {
>>> +				sda-pins {
>>> +					pins = "gpio119";
>>> +					function = "cci_i2c_sda";
>>> +					drive-strength = <2>;
>>> +					bias-pull-down;
>>> +				};
>>> +
>>> +				scl-pins {
>>> +					pins = "gpio120";
>>> +					function = "cci_i2c_scl";
>>> +					drive-strength = <2>;
>>> +					bias-pull-down;
>>> +				};
>>> +			};
>>> +		};
>>> +
>>> +		cci0: cci@ac7b000 {
>> Looks completely mis-ordered/sorted. What are the nodes above and below?
> Hi Krzysztof, sorry, not sure how you mean exactly. The ones above are 
> the pinctrl nodes. Each CCI has two masters using two GPIOs each, one 

Why would pinctrl nodes matter anyhow? Please read how DTS syntax works.

> for clk and one for data. The ones below are the actual CCI HW nodes 
> that make use of the pinctrls. I believe this is inline with previous 
> generations. Have I missed something? Thanks.
I wrote what is wrong. Is this maintaining proper sorting? Did you read
DTS coding style?


Best regards,
Krzysztof

