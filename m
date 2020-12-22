Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B0F2E0B7A
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Dec 2020 15:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbgLVOLj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Dec 2020 09:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgLVOLj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Dec 2020 09:11:39 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E4AC0613D3;
        Tue, 22 Dec 2020 06:10:58 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id s26so32211846lfc.8;
        Tue, 22 Dec 2020 06:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y1lU1YgL6+E1+qOuXe7lokwiGciBRY0e4F95lRdLuOQ=;
        b=nDqp6cFt1MP+0v648JrkyGlAzQVj2jltRB7/qmuFLNi7Llooj3rgD2FDVBaS0VwWxe
         vS54tcRB5i2QKKd/5vKYdE7t0T2zE0DwZEvRn6gnxPd/v6Uy1ggeRENAXTIalyl20ob8
         ZdqtXOpK0NdHFAZVayf+qRarbssOLB/x2tTghKeqRpujYNHvoIml2/RMiDTU0ykqHCAM
         5739KtmoxLiY8udnybC0fSunTBQikkMM41/jkEoQRJPs7A1bl1jv8ap9WEJmp+nkCq0N
         LxdgmbwqopZC4NFnRGzaFaAZCCMeOq0Ut1t//8gZtxYv2Bx3ERLkNdSl6dhNEiQe18HL
         93Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y1lU1YgL6+E1+qOuXe7lokwiGciBRY0e4F95lRdLuOQ=;
        b=InFoblKHBJw+YVdQo8sJyCu90ACN4kBHy6FSnOe333WWyOvWoxiSJXKEKNp+FlsDi5
         1xT9DqUl53gN7+CHrwDfqZUQ3DfP6KS8oliT+TMNcUxBZZJr0nsOhbE8griw5sW3BuLu
         eI/4oAkmFEymR25ANTRlCbj8LCrTj80ASQCJ0aYGODho2FwuZORZN14TmRStAXwI8AN3
         wHF0v2PbvE+nGuzQf14vwC7/bUusMSSqvqyf5bmaWP9WNxPLB4LwoXiyYxWb/rxRsq4r
         nhDOlzBvZmrCSoARBZNQWO/wfFzk1+7LPHtQUPxs5NeNGiC01dIjZlamMPE4f/sC95nT
         SKzg==
X-Gm-Message-State: AOAM533kZbtu4KSqL1q9oHsXeRvLIXiENoSgZ37rpyIuiWXu7ZNZ4UdM
        LbGhtJ4+6B8IBVMpMMHowXHLMApaZs6CaicUk3s=
X-Google-Smtp-Source: ABdhPJxDpoQvqLY5lh6Q0fQYa8MdsPD2XILo42dE2cCD88li8Zdwh5BSJeYyZIfOmq8coUS15pvxrgb9r7xtIikk27c=
X-Received: by 2002:a19:e20a:: with SMTP id z10mr2080146lfg.295.1608646257078;
 Tue, 22 Dec 2020 06:10:57 -0800 (PST)
MIME-Version: 1.0
References: <20201222133131.19525-1-zhengyongjun3@huawei.com>
In-Reply-To: <20201222133131.19525-1-zhengyongjun3@huawei.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 22 Dec 2020 11:10:45 -0300
Message-ID: <CAOMZO5CkNBsOdHxqh=2eTDh7AWMke=bPocg0n3mLh=VU5T43EA@mail.gmail.com>
Subject: Re: [PATCH -next] i2c: busses: use DIV_ROUND_UP macro to do calculation
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Zheng,

On Tue, Dec 22, 2020 at 10:31 AM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:
>
> Don't open-code DIV_ROUND_UP() kernel macro.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
