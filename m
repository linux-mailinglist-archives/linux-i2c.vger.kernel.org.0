Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53ED71DECE4
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 18:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730283AbgEVQKJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 12:10:09 -0400
Received: from mout.gmx.net ([212.227.15.18]:47763 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730195AbgEVQKI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 12:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1590163803;
        bh=oAfsmsmdUbKlkNQYHAlX5VbCiuT5W59YkuSNRcCctfM=;
        h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
        b=c7IbABaZZpnPp4i8Wd54mc9QN+8meHxpOymSU3mIMmK3Egl6S7kdFsLNF4Bjgb4hb
         iyFiFOel4TpAhvundeevm66ONnnpN+0b3JnRzD8xMc5RHEu7XkBzc4icy56y2uWftX
         QTuNGM43hsGSiTvYsocQkME+/4MlbSQt+Z1KEaLQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [172.16.252.102] ([78.48.61.116]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC34h-1jlkV43LKP-00CQHb; Fri, 22
 May 2020 18:10:03 +0200
To:     loic.poulain@linaro.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, robert.foss@linaro.org,
        vkoul@kernel.org, wsa@the-dreams.de
References: <1586248382-9058-3-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v7 3/3] arm64: dts: msm8916: Add CCI node
From:   Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Message-ID: <f127d7f3-d69e-1137-4366-5fa77abc5c3d@gmx.net>
Date:   Fri, 22 May 2020 18:10:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1586248382-9058-3-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pokvHtU3pXHx6mmee0zXOBUvmJamvhSutXSXoAiVSbeK1zxbqzT
 3wQLwMfM8hwQsilUDxMdG9h9gCcfuARbmDYDa3wG9EUwPpVC6sLsBsXPT1JqaQGOuGt215V
 /Hl+7UTKVw5xl9pZJtYtKI3/MI0NxG9I3rMEnA5gnwy/x9pR9YjwqkdOGNmfpnJMSAvGfNt
 nMsH6mxM/OGBmnGIGLU2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KqF8IInTPxo=:OLc/bKnGZiwP5lNm2oDCDY
 R5KkZSSrA+nz5xXLDOSwHdDUwDlQu7K5rhowLPUvNj0uN0qwsA5m5K7yZ1Jl5R/m+g6PdMujI
 fqohffgqTAVX+b4MdkILOAeHsM9WppiT02ycHS7uLgRxX6ILyMfk+Z37fOs7QHTYFPEzZleRD
 h3TObUWoBNGYpMbm4sPF5xlXRDkaF/ssEaNqDNcUjP8Bz6bKHToM8/kejWl0dJThGneVexKQJ
 x4RmFQgNGR5XECFqkyiP8PZPeAUFANE1ihM6xuOfiTShtOlyTKZ/lepEGQjSfm0yi9zFzGhB1
 KrfdwStfHQKDBaO3WkvznUACeLAdGAWhrUeuWBAxVJYHoeygAc8Zh1nyKSy0h/AkVipztT7/V
 MclkCX+iyNGvLq+eT6B+FwNtgF5txZ3KOtC6q2mwRhGaKKnPsDRTDOhtish/70vayovet74SL
 zKuS14eNYYqtBm6pM58s062J3A22nwury2YOonfnKEvqaHFGlfnbMVq/kmMyU6DjmROMLcySS
 5rMKhsNBtqtq4ZKQB/b2OoCwbNTj1WNlI4hrO71WDqyXe2TzkAsYU9ziIFXZ9uR4oCeGgqodr
 qg80wUNAO7TmzgvUDOt9YjfTy8tQhTYNT/bNqb4SaE5dJaMByYnpmIVbFcLUNFzeoWHes0Oa3
 WGxcV69IxRhFsopPxKuDT6HcrE8ffpvIaWsGLtVHBgBReOB9JdXE5FC9U0RIQ6+yRO5tvVHjB
 ES5lDeaaUqXyPOfyKc7b+4JsCcHt2QTlPFTT7kM9nirg/8y1HzZTVLGueCaw+FEysAh7phaiM
 DzRxVmSczQ/Blt6JixJfpIrVM9nERPV0tB68WWq8h2D7C8b/oEb45BxzAisdSu03cZH2VarSd
 GRLZ5/OtkLj7fJKB3T2kr2WAS4FL/sIlKWXZvhXnKtbcmJBpxMYqewA1v4duI9H6+Fvg34y1e
 8T0BizBMEvh88eacO70aythOwlZsOesbwDTrvtfjOyRs3gE3PxXqvK4OloXNCRiot/sGDyPA6
 Zye2iBPuuRJH3EfF5dno7wrpOTM1Wbn9qG6Na0kyDE1EMDUBL4QrSib/h4/JzcoifbQ++n+gn
 vbmpheymweBUbdBd7hJxIuO0RixvJeGID046Fux5F/X7B2zygSMTgGCFNog3mRrOWS1eJmpvP
 r+FAWojlUGO+dkXqii5bmvcZgaIjC7RyrgV4osAFlLOoYNd7HOWdZExO1JNsaYqi8WguzasKD
 ypK0RkGgF9sA4UjRQpZV4Xkil19NjuIk3o15yCg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Loic,

it seems that this patch was not picked up in any tree. Do you think
sending it to linux-devicetree would help?

Regards,
Carl-Daniel

> The msm8916 CCI controller provides one CCI/I2C bus.
>
> Signed-off-by: Loic Poulain <loic.poulain@xxxxxxxxxx>
> Reviewed-by: Robert Foss <robert.foss@xxxxxxxxxx>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@xxxxxxxxxx>
> ---
>  v2: add this patch in the series
>  v3: add only cci node for now
>  v4: no change
>  v5: add cci label
>  v6: no change
>  v7: no change
>
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
