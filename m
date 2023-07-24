Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA13775F679
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 14:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjGXMiT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 08:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbjGXMiS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 08:38:18 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9052E66;
        Mon, 24 Jul 2023 05:38:16 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-55b5a37acb6so336028a12.0;
        Mon, 24 Jul 2023 05:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690202296; x=1690807096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHrTawO6Evdgbzp/9WCQR8KuSPkqz1GJWvZeIl1W1GI=;
        b=jRy5ndisFvVQsMd6CxFNd+mgACtkNEojqqRazkgOgMlQ3fUroPR9rXdVPQPg/Mgi8/
         YMFf8SDJfZJZzuMTUu+BtZXunHN7s5Wv9E5UPYfHg74xpxjvUBPvvgJ3BoMkNIn3ET3N
         KlfJ4ti0GigCkpShGINB+NH71Tq0JxwbU5q4QLGoe1KhoPys73AJMf2xijq7kBHRzMGm
         jpH+j++twYA5K9UNMhwp633eowwwZHvzSbaqr/8IJdnq2rG4bRuShkeTwT+GaV7IF3J1
         w/4jo1jUIPKWBgz0J1/L52gJhTk4xLiCfo+/hZ0aqnCPAeTuzsMfh/GPNIdFGrUIT+ea
         Vwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690202296; x=1690807096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHrTawO6Evdgbzp/9WCQR8KuSPkqz1GJWvZeIl1W1GI=;
        b=aDa0rmF13cZra5SG6nPaM3QT+3MjzrQTc46CXyQv9kaZfegylWZarQdi/UBu9GIhvg
         QEqDL4pQFqbz+S39RFpBH3b700HerUplMNsSnc9Q6Kr1gzxmLJDITpLuMqf4FztOqqFa
         Q9Yv4s+BBhawRIVCEmwSkcUMSMk8L3IUPQQ2J7eCOIM2nfMBl1NaEKF0rPLzR3cDXd4r
         78YN4Zy1HA7luavR4qglbMV3EjiYvi4fsSUNuQLYnkyO4lTyxgxcf64Ig6peVPvykcTa
         LEcQS0/aZ1fR2cK+vwEMH9L26foyoSurbaGGjMvJyuBh+46u+RqGPcggUGHjklXuXxEV
         C1Mw==
X-Gm-Message-State: ABy/qLYEym3y9ABbcTol/cF8L1c7IVNeOGU/rLkDaAihM4L0+ENdL45p
        HeuI3dALlQAp1Kdr2zd09CO6qP9dqt0bn08RkPDUDV2H
X-Google-Smtp-Source: APBJJlFFS2CJPlSkthCHGJB97vwn1hWgIyObWrIYbvKOZHQjLSGvgYHwWH0PF2veE+P46/GknnqPNW1+g6jg1Hy+vMk=
X-Received: by 2002:a17:90a:4fe1:b0:263:f36e:d610 with SMTP id
 q88-20020a17090a4fe100b00263f36ed610mr9256694pjh.0.1690202296005; Mon, 24 Jul
 2023 05:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230724105546.1964059-1-carlos.song@nxp.com> <20230724105546.1964059-3-carlos.song@nxp.com>
In-Reply-To: <20230724105546.1964059-3-carlos.song@nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 24 Jul 2023 09:38:04 -0300
Message-ID: <CAOMZO5A28fNmMRwG6dX8vY2OkgvcmjqAJWQmjTXT9-OkAcYrRw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: imx-lpi2c: add debug message when i2c
 peripheral clk doesn't work
To:     carlos.song@nxp.com
Cc:     andi.shyti@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de,
        xiaoning.wang@nxp.com, haibo.chen@nxp.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 24, 2023 at 7:52=E2=80=AFAM <carlos.song@nxp.com> wrote:
>
> From: Gao Pan <pandy.gao@nxp.com>
>
> Output error log when i2c peripheral clk rate is 0, then
> directly return -EINVAL.
>
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Gao Pan <pandy.gao@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index e93ff3b5373c..12b4f2a89343 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -214,6 +214,11 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct =
*lpi2c_imx)
>         lpi2c_imx_set_mode(lpi2c_imx);
>
>         clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> +       if (!clk_rate) {
> +               dev_err(&lpi2c_imx->adapter.dev, "clk_per rate is 0\n");

The subject says 'debug message', but this is an error message.

Please adjust the Subject.
