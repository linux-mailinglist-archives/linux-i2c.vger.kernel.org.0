Return-Path: <linux-i2c+bounces-14307-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C9C8D4AE
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 09:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0253D34AC3B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 08:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8247320382;
	Thu, 27 Nov 2025 08:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYHMqsDD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B751F4180;
	Thu, 27 Nov 2025 08:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764231161; cv=none; b=hX+0V6TsV2EnEDJ2P63lqJU988MzZiPIDtCNbpSI/tvnNpSvtbxcP1yd7EcQEXw/h0UXmXsBpwV+GzRZgowkNNY4Wz7K4P0muoi/LPVRfiPG/N5yuChEHHkNcO/ETMAYCaSei8Y0gKB9QTKYL3P078ztloyub5lfUGseNNGelYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764231161; c=relaxed/simple;
	bh=n60wrRFxmc2+lq/5VFolE4ViUstRu/ZGXCU84RRLtbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrqjxCoj5BIlHckrtuGVI0RbvTm4fhsw3S1Hz1etqVOqmj36QPgVKHrel0bGVovBG3+ZJ1+mz+lj3hO4C2mGBiU1obatUo5xqg75LV8rTlpRJgr8JqUY/ReaIeCtdUQHKaeMsdw9ajsbOcoCmc+etzO4gLI4XZVJ3Em5II5EkIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sYHMqsDD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C41C4CEF8;
	Thu, 27 Nov 2025 08:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764231160;
	bh=n60wrRFxmc2+lq/5VFolE4ViUstRu/ZGXCU84RRLtbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYHMqsDDxIEAiVE7n4IF4l3qiz1pYuOba6xSroNpdRgej9ZPOvUPXBM6t7DbQGqz0
	 yhy/b9RmA0QLVtyDP19JrH/AlnmBHQyhWug7qSfutRfl9Nzp/OX+qGbu58ZR7NMsQ3
	 uUnzpwCVWet4nZzTUmXC9OK/qgO+G+RFAzeGt63/HXq0JtnAnwSDYClaGgKBifty4V
	 Cc3bfhc0U1pFFv6KeusMJccAL+qMZaFMHp4q/HL73UFX7IFcOsbZL/VCuNF4np4Gxu
	 STPt1Jzrpq5lzUX77EH5xNzfFJZ8UPFL+QkoFIgCfGSAx2cKGCQuM/cAtmQDoOm5oA
	 +OdbZnTA+UYCA==
Date: Thu, 27 Nov 2025 09:12:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	jeyaprakash.soundrapandian@oss.qualcomm.com, Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Add support for camss
Message-ID: <20251127-steadfast-red-koel-8c9bc8@kuoka>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-7-646fee2eb720@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-7-646fee2eb720@oss.qualcomm.com>

On Wed, Nov 26, 2025 at 01:38:40AM -0800, Hangxiang Ma wrote:
 +
> +			cci1_1_default: cci1-1-default-state {
> +				sda-pins {
> +					pins = "gpio111";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio164";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci1_1_sleep: cci1-1-sleep-state {
> +				sda-pins {
> +					pins = "gpio111";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio164";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci2_0_default: cci2-0-default-state {
> +				sda-pins {
> +					pins = "gpio112";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio153";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci2_0_sleep: cci2-0-sleep-state {
> +				sda-pins {
> +					pins = "gpio112";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio153";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci2_1_default: cci2-1-default-state {
> +				sda-pins {
> +					pins = "gpio119";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio120";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci2_1_sleep: cci2-1-sleep-state {
> +				sda-pins {
> +					pins = "gpio119";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio120";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +		};
> +
> +		cci0: cci@ac7b000 {

Looks completely mis-ordered/sorted. What are the nodes above and below?


> +			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac7b000 0x0 0x1000>;

Best regards,
Krzysztof


