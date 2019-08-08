Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A00CE860DB
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 13:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbfHHLa4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Aug 2019 07:30:56 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45866 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728542AbfHHLa4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Aug 2019 07:30:56 -0400
Received: by mail-lj1-f194.google.com with SMTP id t3so3527ljj.12
        for <linux-i2c@vger.kernel.org>; Thu, 08 Aug 2019 04:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rsn/QjhHsYVZcVYw5ykTDUIyzti2/WLGoKByDoxpogM=;
        b=IvkwKSmClBg5FnhvVCtiWy8CZXkrlH2moXfvGDtRLHNkSnGmo8eqDcw4ltDsdV2lZr
         m/unSeAoWbg2Ng82xlQkQpQhmbKNuzdD9KfpLnuJeUNGRKo5DeKreJonjWlCJ9YIv3m+
         VgY8n+cRupgO08kmsMOxbWn9iPZQnvy3pVcQiClJDXFMGImeNPSyAkNyOcpaN7ddsraL
         qYPxTNBx6ruTzKA5nQsteLNGitvxr56XZmldhnQjHfLti2nBD4mrhT37fD4uMaYOKDL4
         iqEoAZsgqqgq0LPdbP+lc4n0Kp6jBKNeqOX+4k4WJayS6S0kJpSxCW2xZIeeVGg0tWWF
         jMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rsn/QjhHsYVZcVYw5ykTDUIyzti2/WLGoKByDoxpogM=;
        b=Yjz9bUgF34QkXSP1c5dji0SYDc/P+M2V0ojQU8WQJzVgrL02VreABFmG7eW5ZE7rzE
         6Zei6Sx96IGgLaUgtpU3mLfOaltj7a86O7VoEsaVpYMuxDGpSJPwTfcnWcWXOgluPZr3
         AZc9Lb2wDhGQrB4N8O1lxzVFYwBUhOU1uC7yCzf7Bx763TnNXhwKLk2Apf5OD2PiO18I
         YDTSetgFDwoyU92eioUMUcP2KQVt6fr66l9gTHCemQSaVTRoizRrHLTNz1D0up5csGUD
         YIHHIrap5LLS/H6hFJ646TiA4ZuUQ7tTTs8E1VoQ4IVUxpCgSmnclChO2SSU1J2i8Poo
         MGHw==
X-Gm-Message-State: APjAAAVHtxAOfl5EIc62yv9/ANAxcs4gbzWpG+HPw3eHjpAPivURn8nE
        DF4KjphyydW4ex8gkCOWZ343TIWuJP7Nuz5eb/k=
X-Google-Smtp-Source: APXvYqzGgkCHgqye1ptUuhPgB/sMEO/wGtJmjHdXUsva2kKO6vM2C3ud6IwxwkgUk/irx5Lgk4ctvToufQk23V/FTgg=
X-Received: by 2002:a2e:970a:: with SMTP id r10mr7521084lji.115.1565263853934;
 Thu, 08 Aug 2019 04:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190807203153.11778-1-festevam@gmail.com> <CAOMZO5B_3d2DYMzpchJmM9CnRL0gN6-8zGeB_zorN-0cL8rbKA@mail.gmail.com>
 <20190807211317.GA5193@shell.armlinux.org.uk> <AM0PR04MB421142CCB25E76ED53148E7480D70@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20190808111054.GE5193@shell.armlinux.org.uk>
In-Reply-To: <20190808111054.GE5193@shell.armlinux.org.uk>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 8 Aug 2019 08:31:18 -0300
Message-ID: <CAOMZO5AHQuHTSNWibrNg9Z7gg_GRK2VGcXC8d__6QjSvFTfcuQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: imx: Fix endlessly clk warnings
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Russell,

On Thu, Aug 8, 2019 at 8:11 AM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:

> This sounds like a more in-depth fix than what we should be doing for
> stable trees.  Can we revert the original patch and restore the old
> behaviour, then propose a proper feature enhancement that doesn't
> regress existing setups?

Yes, I will send a revert patch.

Thanks
