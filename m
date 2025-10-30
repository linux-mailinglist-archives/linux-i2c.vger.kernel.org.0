Return-Path: <linux-i2c+bounces-13897-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3F0C1EB72
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 08:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CBA9188A034
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 07:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826F23358D7;
	Thu, 30 Oct 2025 07:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZWhqEE0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3973358B6;
	Thu, 30 Oct 2025 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761808489; cv=none; b=cXoBLoTykOFK6tB64lg2YIPSKWeIty4Y9KGnc6xueuF4tOSzRmpPtuwjBsavpoo6KyIFbGj17Y45U6LVBY/T2RMAgEI4v/n+DXZ9wAwCnPlM2UY0KqWVnZzIcd+rgspeZLAlt1BLGvWfne4y9qLHxzNaJSAUMG2yjCxRJokJ864=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761808489; c=relaxed/simple;
	bh=WD77tKmKY5w/O3RSmdbBKzMTfY9r3GWRp/ahnOefiNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlleM7MotzJnoQhweWMpiqz+iUWieh7H5O8z5IQZhJo+Arb6C4bXI/o/DxELkZC4KcyEhpg7xH0nNY9dmIlSNHCAg/uusDMgryifTsPdZcxgFstN7zWUIWDff7SkyHDcPVoGU26k613B3mPUtRVPaGxmhDob7dtCfm4bTqxvRhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uZWhqEE0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E68FC4CEF1;
	Thu, 30 Oct 2025 07:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761808487;
	bh=WD77tKmKY5w/O3RSmdbBKzMTfY9r3GWRp/ahnOefiNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uZWhqEE0v7kucYmOBKf4QRFYMQNGZdv1nhvKJf6bTHAzDO/zoYGErGf3GJYri/+BL
	 kdt5Ra0vTF49aIJ7jy1FsMYcIPPGfcXe7M2BM9xWUpVBnykxZAF68WOsLAC0OWJjKJ
	 3M84yufh+vT+sPy1B3V6kM+/8PWmrgoPwhNcMxWESbkUCYdH04Ls1iqH42SE9XR+T6
	 UeQyn7v+tL/i40hov1XsBgkNbq6xeEhbk2RIqWALUZjoNkprcX8RAssZS6LO6vA8pf
	 uVqfcfUizMT7drZWB9oqZbCWm/0QR7erp0XfyPOCKgIoEydKj9mTwa0wP+7Y0UcnfH
	 Kaf27Ts3m9jDA==
Date: Thu, 30 Oct 2025 08:14:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/6] media: qcom: camss: Add Kaanapali support
Message-ID: <20251030-tody-of-strongest-wizardry-1f7c8e@kuoka>
References: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>

On Tue, Oct 28, 2025 at 10:44:09PM -0700, Hangxiang Ma wrote:
> Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
> RDI path involves adding the support for a set of CSIPHY, CSID and TFE
> modules, with each TFE having multiple RDI ports. This hardware
> architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.
> 
> Kaanapali camera sub system provides
> 
> - 3 x VFE, 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> - 3 x CSID
> - 2 x CSID Lite
> - 6 x CSI PHY
> 
> This series has been tested using the following commands with a
> downstream driver for S5KJN5 sensor.
> 
> - media-ctl --reset
> - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0
> 
> Dependencies:
> - https://lore.kernel.org/all/20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com/
> - https://lore.kernel.org/all/20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com/
> - https://lore.kernel.org/all/20251023-make-csiphy-status-macro-cross-platform-v1-1-5746446dfdc6@oss.qualcomm.com/
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
> Changes in v4:
> - Refactor kaanapali camss binding style and commit message - Krzysztof

Everything is refactor. That's so unspecific.

For sure adding 8 more supplies is not refactor.

Write complete changelogs.

Best regards,
Krzysztof


