Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2332272D346
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 23:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjFLV1w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 17:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237496AbjFLV1f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 17:27:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F3D10F7;
        Mon, 12 Jun 2023 14:27:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 545D662949;
        Mon, 12 Jun 2023 21:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20EFC4339E;
        Mon, 12 Jun 2023 21:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686605231;
        bh=PIyOOihIuM9mQnDVy4FTTiCuyAP3yZjobR+LEpJGsZs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ABnIG+BgcBz/FfP7gPuKomCrhrPICZrsFAAOiOfhcCPd+nhl7HSC36vCgy4bpwpCt
         CQmkcbWzr4T/dXzlI6L6sWi10yWXeMUpmvF6/Hn1MgOaXLnzPkrrhukbqY5tKb4xWD
         iwInDbXQOmgRJCTvJfYdLjQexOqbsigKEPv7JaUensUpX5FTtFMnPTzsrHHniFu0VR
         9gRz4qhF+u/O3JGMlPMJMtDMuOXIC+ZJXaUYSDr+OjrNm6tHG5ayUJOPpxjr7jIBHJ
         wG8YJnhKU46wpiwrwRGt3yQIA6P6eizmZ6rZfT4LZlHH2qGINd0T2WIHRkiuUnZS+q
         +0YdWckM+pQcw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f61735676fso5845806e87.2;
        Mon, 12 Jun 2023 14:27:11 -0700 (PDT)
X-Gm-Message-State: AC+VfDwarnyBDpy3saamD3RXD76dixUH+iVtgMOA3qnZpeAg8h0GIYja
        Llue3CKUm3wHk6VOi7v2YcbKx6OcqVNz5J6tLg==
X-Google-Smtp-Source: ACHHUZ6dcQxD2lKpmS0LoV69AY1i04I8MaEDIGsQuybd6qjmOv3Xau9DumusICCpJdIeWGzwpXZ3UR1/PaHAchL23ok=
X-Received: by 2002:a2e:a165:0:b0:2b1:e369:f98 with SMTP id
 u5-20020a2ea165000000b002b1e3690f98mr3428550ljl.11.1686605229684; Mon, 12 Jun
 2023 14:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230609183044.1764951-1-robh@kernel.org> <20230610093625.gvgbt7g4xvnuuog6@intel.intel>
 <CAL_JsqL9ax73zdn148S_7M0SyZqQfWh1Hr_yY5Vary3qye7bjQ@mail.gmail.com> <20230612210826.gmgrwjyu2g7jrysh@intel.intel>
In-Reply-To: <20230612210826.gmgrwjyu2g7jrysh@intel.intel>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 12 Jun 2023 15:26:57 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+wcrOjh7+0c=mrg+Qz6dbhOUE-VEeQ4FoWC3Y7ENoyfQ@mail.gmail.com>
Message-ID: <CAL_Jsq+wcrOjh7+0c=mrg+Qz6dbhOUE-VEeQ4FoWC3Y7ENoyfQ@mail.gmail.com>
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

On Mon, Jun 12, 2023 at 3:08=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Rob,
>
> On Mon, Jun 12, 2023 at 01:27:03PM -0600, Rob Herring wrote:
> > On Sat, Jun 10, 2023 at 3:36=E2=80=AFAM Andi Shyti <andi.shyti@kernel.o=
rg> wrote:
> > >
> > > Hi Rob,
> > >
> > > On Fri, Jun 09, 2023 at 12:30:44PM -0600, Rob Herring wrote:
> > > > Use the recently added of_property_read_reg() helper to get the
> > > > untranslated "reg" address value.
> > > >
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > >  drivers/i2c/busses/i2c-mpc.c | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-=
mpc.c
> > > > index cfd074ee6d54..595dce9218ad 100644
> > > > --- a/drivers/i2c/busses/i2c-mpc.c
> > > > +++ b/drivers/i2c/busses/i2c-mpc.c
> > > > @@ -316,9 +316,10 @@ static void mpc_i2c_setup_512x(struct device_n=
ode *node,
> > > >       if (node_ctrl) {
> > > >               ctrl =3D of_iomap(node_ctrl, 0);
> > > >               if (ctrl) {
> > > > +                     u64 addr;
> > > >                       /* Interrupt enable bits for i2c-0/1/2: bit 2=
4/26/28 */
> > > > -                     pval =3D of_get_property(node, "reg", NULL);
> > > > -                     idx =3D (*pval & 0xff) / 0x20;
> > > > +                     of_property_read_reg(node, 0, &addr, NULL);
> > >
> > > because of_property_read_reg() can return error, can we check
> > > also the error value here?
> >
> > Why?
>
> Because if a function can return an error, the error must be
> checked. Even if the property is "reg" and the binding says that
> it's required. Otherwise let's make those functions void.

Then every function should have a must_check annotation, but they
don't as the function is designed to work with optional properties
where we want to ignore errors.

> > The old code wasn't worried about of_get_property() returning
> > NULL on the same possible errors.
>
> Sure! Checking the error comes for free. The patch is fine as it
> is, mine was a little improvement I asked for. I can still ack
> it and add the error handling later myself :)
>
> > If anyone is still actually using
> > mpc512x, I don't think their DTB will have an error at this point.
> > IOW, is improving the error handling on this really worth it?
>
> In my view, every error needs to be checked as every error is
> unlikely to happen: it makes the code future proof and makes sure
> other components failure don't impact the normal functioning of
> this driver.

An error in this case is a bad DT. It's not the kernel's job to ensure
DT is correct. If it is, then it is doing a terrible job. The reason
we have dtschema is to ensure correctness.

Rob
