Return-Path: <linux-i2c+bounces-296-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FD67F08D7
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 21:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0C42280DAC
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 20:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627A2199C0;
	Sun, 19 Nov 2023 20:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="E4jYA/oN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA809BC;
	Sun, 19 Nov 2023 12:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1700425726; x=1701030526; i=deller@gmx.de;
	bh=miLPHMfrxwqmKAd27ektH7WBR0JCMcBObraky+HNbnc=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=E4jYA/oNAE1F4fRLys0rhnfWTR6mbTmPHQKKEJCETWu0LBaCX91aeusBuo8GftgP
	 u5Yf+8CJMYTesutHmhgZPjLc0YIey1P58hytjI3W2oI6cmJD4a66ddUDeMTYL8cPz
	 06sC6LXnnMMug/2n122HJpqwJaCvsitj+wSg4/dgVqWovLl7DbuexVwk5XZQWvs6G
	 qqlc6B7JrjRbgGzZ/67UtE1y7q+aAam2vyubXPuewtivWKGQphESEIF/5ZfjYElhX
	 fJgtaP/GBWiy0Y5u/q27PPZDVcdZ5rJ2M15RPfuUwzZELKSuLF7iMrykojzgG+H2w
	 kueKdwgmN4PFyJii8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.146.64]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0oBx-1rJSwN2Ptl-00wmKV; Sun, 19
 Nov 2023 21:28:46 +0100
Message-ID: <e40b913f-379f-4b6e-a0d2-844887a17284@gmx.de>
Date: Sun, 19 Nov 2023 21:28:42 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 00/20] remove I2C_CLASS_DDC support
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 intel-gfx@lists.freedesktop.org
Cc: linux-i2c@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AOqyT+NYfpLX8ZR5FyXZkrdchrLDHO79+2/Qu8gOe5asfRsZTI/
 IriLQSNbku4YQ+qp0/psHOEUtwe2GGW1KQKpfJRDT6tPEzLiP39Yb3jaivbCF34rs3NAAAK
 P77AvvT/8I3KI1mZu0lQ/gc8VMpyLMtSdecqmqbnSEio473SWbeyQnNtoP5uzUPbcX0IuM2
 8iJWd3wafDn6+LxRy4xYg==
UI-OutboundReport: notjunk:1;M01:P0:3klw1RSna4g=;NZvvWyleiLnoQ8OEiVQyCF0geUn
 nn/XK+nqayeGU7XpzHB2xZWPxSeQ0TuaqQNo5XKDdkjffQ4mScPbkzxfO9ECE0g2o9LHF/OYT
 U6yLvwgXnTHZKnDQPgOxFmvtFrIsyfdPS5g97tBjmA97aGXzPaZYZ0iCTkkfSmTwkHbjCg5qd
 HGUwtFENdTexjJOqcMiN3bYTJx+FtZpl/57KhpOz7lK/o9bNYP3taYD4o8bU/rnqSmhnmkj6C
 CSHDSv8SP6bMPkGDEZMhOlkARgyENdqiKlopMUrUtLemjT4DN6IF/OixCcBFUOpuhRXs81XP3
 toMLZAIvkj3RPf7b7eW6PQ91dbAagZCmzWyVg6wKxGORVgHu6JKeIyGyfzNXru9mK4F7RHz+f
 YU0z97BEViaNubXCd7VOHEUYYNPV6jnXeF3NCaeAb+ZrLcfRFPvpI47xFK8ZmEvs/myvtOVJ7
 kkrpy2Nnp+Ied0vCKeqT/uKKAhBCp4LmTUpDM7zagtPIlSESuwLdGM7oxTGS4RTWH6tZnRwxs
 Kcv8ok/g8GBzbylu0F0Mi9MpggjTmTetgZtJ0O1f8Px/1/lV/FtHpHV4ifpjdpI1UKkJgKcps
 ZbC+C1cJnT9MlPFKGHdZHuBfH1gcz/5Pfuj6/P1s/tgc2CiQKEMAFvFiNFBnL5/aREPKxH13S
 h/r11uIpW9F9rQoWWzWXa1BtrMFrcycVfOJALbQtU8gilexeWnHUbPnhQqdjMPmbpNcBgBJwO
 crpbmKctnh3VXv80OG3fJQp+c4fNoJE95P5kZXyAii1keAfTjwzboKsqGEMB4lfhLRYp3z41C
 xMm21d0Q5JGoWeY0gC/ZaS8A+1Jp79XUHwYUCPOVpa2FLkx0lIYxEycHSXXgrZpzBd0P/pt06
 D147Z5XdRZHyh9dhBcQGisXZ3gtvbA4nBK1CO1grjhgR66s47R1ONMw52V2yIVEXJIyqAty5v
 PUXMfmHELDEjshgicEPFWlfBqK8=

On 11/19/23 12:28, Heiner Kallweit wrote:
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
>
> Preferably this series should be applied via the i2c tree.

The fbdev changes look at least ok so far, so:
Acked-by: Helge Deller <deller@gmx.de>   #fbdev


> v2:
> - change tag in commit subject of patch 03
> - add ack tags
> v3:
> - fix a compile error in patch 5
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>
> ---
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c           |    1 -
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
>   drivers/gpu/drm/ast/ast_i2c.c                     |    1 -
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c         |    1 -
>   drivers/gpu/drm/display/drm_dp_helper.c           |    1 -
>   drivers/gpu/drm/display/drm_dp_mst_topology.c     |    1 -
>   drivers/gpu/drm/gma500/cdv_intel_dp.c             |    1 -
>   drivers/gpu/drm/gma500/intel_gmbus.c              |    1 -
>   drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c        |    1 -
>   drivers/gpu/drm/gma500/psb_intel_sdvo.c           |    1 -
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |    1 -
>   drivers/gpu/drm/i915/display/intel_gmbus.c        |    1 -
>   drivers/gpu/drm/i915/display/intel_sdvo.c         |    1 -
>   drivers/gpu/drm/loongson/lsdc_i2c.c               |    1 -
>   drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c           |    1 -
>   drivers/gpu/drm/mgag200/mgag200_i2c.c             |    1 -
>   drivers/gpu/drm/msm/hdmi/hdmi_i2c.c               |    1 -
>   drivers/gpu/drm/radeon/radeon_i2c.c               |    1 -
>   drivers/gpu/drm/rockchip/inno_hdmi.c              |    1 -
>   drivers/gpu/drm/rockchip/rk3066_hdmi.c            |    1 -
>   drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c            |    1 -
>   drivers/video/fbdev/core/fb_ddc.c                 |    1 -
>   drivers/video/fbdev/cyber2000fb.c                 |    1 -
>   drivers/video/fbdev/i740fb.c                      |    1 -
>   drivers/video/fbdev/intelfb/intelfb_i2c.c         |   15 +++++--------=
--
>   drivers/video/fbdev/matrox/i2c-matroxfb.c         |   12 ++++--------
>   drivers/video/fbdev/s3fb.c                        |    1 -
>   drivers/video/fbdev/tdfxfb.c                      |    1 -
>   drivers/video/fbdev/tridentfb.c                   |    1 -
>   drivers/video/fbdev/via/via_i2c.c                 |    1 -
>   include/linux/i2c.h                               |    1 -
>   31 files changed, 9 insertions(+), 47 deletions(-)
>


