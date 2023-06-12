Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7033F72CF70
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 21:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235542AbjFLT23 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 15:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237600AbjFLT21 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 15:28:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BBB10FA;
        Mon, 12 Jun 2023 12:27:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F052662D9E;
        Mon, 12 Jun 2023 19:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607CCC433D2;
        Mon, 12 Jun 2023 19:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686598037;
        bh=iJCZ76QVcYu+WrnDtaY6T9pVzx4+azFJ79YHZfLwbIY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UHxBL4yfXKQOT9XEXIX9TCw/HUkznuuCgmo6o1mUeyrHMTMo21FjTZaMWcz46N1Y0
         F3ZGjlSiWCpkFIZJnumJGKR0LyDkSPetfU7E8z+14cxPS2MQMfjyU6ZAKVjee1CT/N
         kiwg42KY3r5UGN2rYS6+Rupi3rk0T+8MFHzsvGgOFnXYqGdjPlyn3O3/RaU6ourGrQ
         LL8i3wy244IucPx+8dn586a0Bjo/emq2brgifkzAw3vl3zvrOwlErpN38vruJL/GM1
         SE4TrlwT3sIUbxBSckgUH+FAYUQwqDs5peXXR65iHK1J2Hp3TyLIKi0CGMhvhZW1mP
         d/eM0aCcYKxPw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b1adf27823so57447821fa.2;
        Mon, 12 Jun 2023 12:27:17 -0700 (PDT)
X-Gm-Message-State: AC+VfDw4b4ETzg9dJOYld4MMZ9GUJK5rqoiL1V5W2rUDHuCngyCz5X63
        VUdKrUZthDjzG+KqXjrrA/s6eV4MsQniaypBVw==
X-Google-Smtp-Source: ACHHUZ4Oo+luUo4/b3eAGBHO2o/YJy0nbQ8Elg00rvCPSQ4v/mgVpYdoeH/Oaq/G2JxyGhLyng3L/YE3TqnWMwMx2fs=
X-Received: by 2002:a2e:241a:0:b0:2b1:e958:efa0 with SMTP id
 k26-20020a2e241a000000b002b1e958efa0mr2807470ljk.50.1686598035363; Mon, 12
 Jun 2023 12:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230609183044.1764951-1-robh@kernel.org> <20230610093625.gvgbt7g4xvnuuog6@intel.intel>
In-Reply-To: <20230610093625.gvgbt7g4xvnuuog6@intel.intel>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 12 Jun 2023 13:27:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL9ax73zdn148S_7M0SyZqQfWh1Hr_yY5Vary3qye7bjQ@mail.gmail.com>
Message-ID: <CAL_JsqL9ax73zdn148S_7M0SyZqQfWh1Hr_yY5Vary3qye7bjQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: mpc: Use of_property_read_reg() to parse "reg"
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jun 10, 2023 at 3:36=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Rob,
>
> On Fri, Jun 09, 2023 at 12:30:44PM -0600, Rob Herring wrote:
> > Use the recently added of_property_read_reg() helper to get the
> > untranslated "reg" address value.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  drivers/i2c/busses/i2c-mpc.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.=
c
> > index cfd074ee6d54..595dce9218ad 100644
> > --- a/drivers/i2c/busses/i2c-mpc.c
> > +++ b/drivers/i2c/busses/i2c-mpc.c
> > @@ -316,9 +316,10 @@ static void mpc_i2c_setup_512x(struct device_node =
*node,
> >       if (node_ctrl) {
> >               ctrl =3D of_iomap(node_ctrl, 0);
> >               if (ctrl) {
> > +                     u64 addr;
> >                       /* Interrupt enable bits for i2c-0/1/2: bit 24/26=
/28 */
> > -                     pval =3D of_get_property(node, "reg", NULL);
> > -                     idx =3D (*pval & 0xff) / 0x20;
> > +                     of_property_read_reg(node, 0, &addr, NULL);
>
> because of_property_read_reg() can return error, can we check
> also the error value here?

Why? The old code wasn't worried about of_get_property() returning
NULL on the same possible errors. If anyone is still actually using
mpc512x, I don't think their DTB will have an error at this point.
IOW, is improving the error handling on this really worth it?

Rob
