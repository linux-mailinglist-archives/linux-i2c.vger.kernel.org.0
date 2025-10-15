Return-Path: <linux-i2c+bounces-13503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B63FBDC7CC
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 06:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B20D23C84BF
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 04:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C859C2F99A6;
	Wed, 15 Oct 2025 04:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmokPhXN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538B326E6F3;
	Wed, 15 Oct 2025 04:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760503078; cv=none; b=r/Q/XVGI5MyaHiIEtlZiKsXst86smeVkzw1zLimB9NlBupGiVNZIqrh+hp7Tco3BRWPOB+DkieML7i7fkFCffgbZWbMqDOYe4v2uzqD3BrvTfGp+4JsPtcxh9rMnBsLsk9dIAaNzDef2UerV3wJHja7yhbMCQgaimKRlg8zQHqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760503078; c=relaxed/simple;
	bh=e8fLoNpGwDhb+J4znxdIRyrtSPbPuAVzi6IjRHr2c9I=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mis35484QTtKW5oZPdqNhzeZPQZYq1F6Xmit6YnIQuez4Bg9S7nyErJBLLZl8kwjwk6cNu/1EJxd11hJJBGssoI7zNU+kqt09qMF/4fijL3iT6icJELslrdXIq07O6DLpc30M33GjkeE1RPO5Ac3cdRW8bEdP8Elh+uZbjMXfrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmokPhXN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91832C4CEF8;
	Wed, 15 Oct 2025 04:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760503077;
	bh=e8fLoNpGwDhb+J4znxdIRyrtSPbPuAVzi6IjRHr2c9I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cmokPhXNEkYdPihikwiH3b/Z2HfU5ICMjyCJ8ShUDMj8ivClXRAGsen/WQuGH2TeN
	 JRR0JCOCF9R4KU7J4DtzQN/fqjPrFwskFGL54iyk/7z9p+uRr57YIDkdfnpbYghi6V
	 n6yxyN4Xw3lxZJqpofrENn0V2/WA/ibYYf8QXyvdnxPx1b2RTWG3BhiBnRVwrwLTDz
	 I29kVKFt3FWKTD3n0S2QZZV3I/kkV1z0mzFRS1f2u7uUOTmb0VvOv8xut1A9MPZuAQ
	 D6wg7qZFsuIn60e9l5HgkYjSck1UdbdffrMHhWFEt5+7WSpOF9QRne5CTZmqdd1naf
	 U2vbFJjqMCrgA==
Date: Tue, 14 Oct 2025 23:37:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 trilok.soni@oss.qualcomm.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 linux-media@vger.kernel.org, Atiya Kailany <atiya.kailany@oss.qualcomm.com>, 
 Andi Shyti <andi.shyti@kernel.org>, tingwei.zhang@oss.qualcomm.com, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, aiqun.yu@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 linux-i2c@vger.kernel.org, yijie.yang@oss.qualcomm.com, 
 devicetree@vger.kernel.org
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
Message-Id: <176050307578.2006257.1881446437893444962.robh@kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding


On Tue, 14 Oct 2025 19:56:02 -0700, Hangxiang Ma wrote:
> Add bindings for qcom,kaanapali-camss in order to support the camera
> subsystem for Kaanapali.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-camss.yaml       | 494 +++++++++++++++++++++
>  1 file changed, 494 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,kaanapali-camss.example.dts:25:18: fatal error: dt-bindings/clock/qcom,kaanapali-camcc.h: No such file or directory
   25 |         #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/media/qcom,kaanapali-camss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1525: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


