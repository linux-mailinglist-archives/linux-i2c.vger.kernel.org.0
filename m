Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E64ED6D3A56
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Apr 2023 22:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjDBUuN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Apr 2023 16:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDBUuM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Apr 2023 16:50:12 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30EF30C0;
        Sun,  2 Apr 2023 13:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RKgsgD1tYTYBGTTMok0bOs4Nad/x8vn+/+0zyWSjTeY=; b=AepIByBAzBJheyzwNEU5im/WKu
        0tBwBloYlgyDWNCbmQ89vu/Eil2nSyeuaHxUAn0Cjt75giLbYmfTpV+sSmhn1U4pNY1lyWmwlZAo2
        Pd2qId7LBLcWx5iixrUnBRE2WHkCRrsM6dxbX0bNm3PCtTBOlU7i6cCr4RK8TZwDNho16F0RnWQUW
        v8BGKHuLYorGCVkonfQjiGQquRlJuJnE8/bj+2/hsEqFyO0JgXjnp4Cfuxkhqv6TBUhpnabrU6w84
        b77N1Jt7UoTJ6pYGCLQ5GAKOwZ+O1CaCVDuCeudN8h8lIROIYhF96Sn7OGSP1c1/G7otR+a/aDjVq
        ZO2QW3BQ==;
Received: from p200300ccff3ce3001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff3c:e300:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1pj4eI-0002ji-Pz; Sun, 02 Apr 2023 22:50:03 +0200
Date:   Sun, 2 Apr 2023 22:50:01 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengtronix.de, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Don't do pm_runtime_resume in .remove()
Message-ID: <20230402225001.75a32147@aktux>
In-Reply-To: <20230402105518.2512541-1-u.kleine-koenig@pengutronix.de>
References: <20230402105518.2512541-1-u.kleine-koenig@pengutronix.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -1.0 (-)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Sun,  2 Apr 2023 12:55:18 +0200
Uwe Kleine-K=C3=B6nig         <u.kleine-koenig@pengutronix.de> wrote:

> One of the first things that the driver's pm_runtime_resume callback
> does is to write zero to the OMAP_I2C_CON_REG register.
> So there is no need to have the device resumed just to write to the
> OMAP_I2C_CON_REG register and the call to pm_runtime_resume_and_get()
> can be dropped.
>=20
> The intended side effect of this commit is to remove an error path of
> the function resulting in the remove callback returning a mostly ignored
> error code. This prepares changing the prototype of struct
> platform_driver's remove callback to return void.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

As far as I have understand the code that runtime resume is needed
for enabling clocks to access the device

Regards,
Andreas
