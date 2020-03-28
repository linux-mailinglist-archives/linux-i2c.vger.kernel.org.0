Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 873C8196995
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Mar 2020 22:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbgC1Vtl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Mar 2020 17:49:41 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:51214 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgC1Vtl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Mar 2020 17:49:41 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 519CF8040D;
        Sat, 28 Mar 2020 22:49:39 +0100 (CET)
Date:   Sat, 28 Mar 2020 22:49:37 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] gpu: convert to use new I2C API
Message-ID: <20200328214937.GA9505@ravnborg.org>
References: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
        a=Ej2OcDn8OD74Q5IJgyMA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 26, 2020 at 10:09:58PM +0100, Wolfram Sang wrote:
> We are deprecating calls which return NULL in favor of new variants which
> return an ERR_PTR. Only build tested.
> 
> 
> Wolfram Sang (6):
>   drm/amdgpu: convert to use i2c_new_client_device()
>   drm/gma500: convert to use i2c_new_client_device()
>   drm/i2c/sil164: convert to use i2c_new_client_device()
>   drm/i2c/tda998x: convert to use i2c_new_client_device()
>   drm/nouveau/therm: convert to use i2c_new_client_device()
>   drm/radeon: convert to use i2c_new_client_device()

With the ack from Alex I went ahead and applied the patches to
drm-misc-next.

	Sam


> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c        | 2 +-
>  drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c     | 8 ++++----
>  drivers/gpu/drm/i2c/sil164_drv.c               | 7 +++++--
>  drivers/gpu/drm/i2c/tda998x_drv.c              | 6 +++---
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/ic.c | 4 ++--
>  drivers/gpu/drm/radeon/radeon_atombios.c       | 4 ++--
>  drivers/gpu/drm/radeon/radeon_combios.c        | 4 ++--
>  7 files changed, 19 insertions(+), 16 deletions(-)
> 
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
