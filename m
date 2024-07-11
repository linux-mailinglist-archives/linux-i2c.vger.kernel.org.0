Return-Path: <linux-i2c+bounces-4901-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1777092E440
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AE591F21681
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEE81586D5;
	Thu, 11 Jul 2024 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="qxbJKLWi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C115E1581F9;
	Thu, 11 Jul 2024 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720692584; cv=none; b=V79a40DPOYtkOX8gOsXg5MLL24udEiB90Pn1cJdel3pufKYCBYPC6JfGigbuZeYI2Rbr/NcVERuhWGE0Dic69d2Nyu4DCW9BcmwB2P4xtY5F4W/7QLC9KZrDOBOAqvGhKZu8k37eEHHm2s2YfbcLEqYqT+UF6erXErBWBqLSXHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720692584; c=relaxed/simple;
	bh=Z3Vdyi3zK/vmWZo3LvdbXGWWduyqjWq6f0oez7+rFTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5aoxUfbV+48/GK0V6bZp7uFTWNcbqKK2xq68M5JViD8/xS36bFNOoul7seVJR3B0UdxghuKKerIFJ9a1uwoN+Dxjge6o4lFz22YbuGAokaveoJ/vqQ4O9vKrg/1Au2+0AM4FFIhIhPvLkFSKFVC0aiO6bKdlMdk7/DL0RuGWLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=qxbJKLWi; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1720692570; x=1721297370; i=deller@gmx.de;
	bh=+bMT5NnSxXNV7Rt+gMDNsk011QJNzOVj00VzFIO0UKw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qxbJKLWiaJ0zczzHVrjcZ6E1qYTcQBOy6Ox4UVbLd14ZAYG/oMK3gSCy/cp6tCus
	 NehCFEPXfsFpPPBWbkCm0unX/kLzYKGkjz40rehDhSsmVvMjPB7PqYk+bGzzRnWt5
	 NmJabuvB70I7jlclJURi0uVCPixMMNEtNt/17+BKC58PR4GIS+DyKiaXPC4UAHjcb
	 6ApWNpdHxzJ3llo5IgU5ptxxnaJve3FhoenqKvRcMwJE3xWFd35e4E5fQJFcMCYDK
	 ceeHh7oEPWFMxEP0bEQvOLlK5wJOPn68tHBcb6jL/Ot+XKsc5bCtOU6oTFxMjCRRO
	 uQr7GqM/ZbULsaDGQA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hvR-1sH10246rP-016NPq; Thu, 11
 Jul 2024 12:09:30 +0200
Message-ID: <f057217d-0427-4f6a-9d46-a14204a70c77@gmx.de>
Date: Thu, 11 Jul 2024 12:09:28 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] fbdev/viafb: Make I2C terminology more inclusive
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 "open list:VIA UNICHROME(PRO)/CHROME9 FRAMEBUFFER DRIVER"
 <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
 <20240711052734.1273652-7-eahariha@linux.microsoft.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <20240711052734.1273652-7-eahariha@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nTuEi+J0pO0QgpxrgihiAsnCVNswa6CfvW/ncZy/Hs0dN75/QwL
 9CJuepXisexVP3qvIR3DTqFij72hsr02Fn6MqPAWfSuv7bdDMiYBUyB9wjrmFpTFhYM+gXw
 CZQwNY41QL9vKDMxUPnNkP1DpnmXqLiZQ5i3IqDP8opjHDVhMdXuQUB+QX7BTTWOQsXBOCe
 SJfefIJN1Tu/UviGe40aQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:57sjBI7H6D8=;+pORqeKudL3itMM829LC2hw9KiT
 gFZBj/wgRN3u3+nGSbsq1G90rgjbtrh9kxvPs7ceSgHMjHPBYaD/UAfkZnmlSdli2KXD0J8qf
 k+ZatENSAqP6xdjQpF19bgyIWyYIwFuxeAxlS/vUA/b2bJqNSLhi8asdbnv73/Hi1jfUuGuYW
 T7cskBiJUsZJP6XU64YU+llmnyppSS6dbCZhbPaGZ/DUHKDOy9zk195BVJ0+sfWDwryMfL86w
 hJx1fL23TntZCRyOOPW3fsn9aT4kzv+K9oljDWBbF4Xw3+m/bnrzWibsiPa2kdBQOPD2XR+0Y
 u6ensX5BnPVgzkO0TFh5EOLuD/6aRP7Z4e7dYlNFVqpzsZMunJ7QbeNiYGVjxRUZ5ntT8AixK
 pTrOsKLBFPKmrpCa/b1EgEfN4yUrcaiLIEL5Ytt+YuHW1AF6p5RysdD3L8yycBXh9wdvAlbkV
 ECVnsnnnidaQz4e7sVhyyXO2xwij31HfzmIVMLojdHkJrZ2pOiBhuRAIAk6BGyiEsUfUiK4uI
 qm5ll8nXaqOA5URstZ2ULjlNtPUGtZmo4zgZwxdq1+wl/Kv9+UR5ERd8R/QnzpI+kZHnUi3F1
 RbT+Hd270qt0qm4etPtLTs5VCF3PxGRY8FSR7EJGN/q07KHCFoBijKRA5Wl3Pl22qGc2us72h
 Go0YU4hwK0lrQ0e7oxbkEvBTknprfnuIPqq/JEecGqSQk5nvtIrF0iGA6LNjshsgQ301Xx8Mh
 UB5KGN+RRz7LeJCLNYugpwkpZR+pU3wKllqSgx7dpgmV8dNJfIvoPr6Z091xmIxP9XcbG6Iiw
 HM8zKG1qGLXtQZtd6N29ivZg==

On 7/11/24 07:27, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/sl=
ave"
> with more appropriate terms. Inspired by Wolfram's series to fix drivers=
/i2c/,
> fix the terminology for users of I2C_ALGOBIT bitbanging interface, now t=
hat
> the approved verbiage exists in the specification.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>   drivers/video/fbdev/via/chip.h    |  8 ++++----
>   drivers/video/fbdev/via/dvi.c     | 24 ++++++++++++------------
>   drivers/video/fbdev/via/lcd.c     |  6 +++---
>   drivers/video/fbdev/via/via_aux.h |  2 +-
>   drivers/video/fbdev/via/via_i2c.c | 12 ++++++------
>   drivers/video/fbdev/via/vt1636.c  |  6 +++---
>   6 files changed, 29 insertions(+), 29 deletions(-)

This patch was applied to the fbdev git tree.

Thanks!
Helge

