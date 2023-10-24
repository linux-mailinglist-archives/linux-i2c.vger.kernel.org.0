Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3737D5110
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 15:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234767AbjJXNJZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 09:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234764AbjJXNJX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 09:09:23 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570341707;
        Tue, 24 Oct 2023 06:09:21 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 554381FE71;
        Tue, 24 Oct 2023 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1698152959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2mgIghIL+k9sM7wUKoTnltFr1Chr7zlpGRP2FGIbTeg=;
        b=rBZehXn49NF+QLTASoDA+513B8aQQRt430H/SArjtpHvsCWcZJgMKnxXXuBtsmS95zch2t
        rm7pvs9HqCEbfCGCVvuHRMektDlM85T4v1n7y5guQsnVXn52SMLLgGg8+wFivAecwVM4oi
        1FOE8hT+eE6+pplcDIV6Dmcy5P8y0eM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1698152959;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2mgIghIL+k9sM7wUKoTnltFr1Chr7zlpGRP2FGIbTeg=;
        b=X48yXCX6jjwc1caF2fEp9NWeIiolU/t1IWJ0Q7nobF6DGKh/zcHDSpYivLcqxnxhB1JevD
        sUaXaHV4ssZ9uYBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09D891391C;
        Tue, 24 Oct 2023 13:09:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id FlNaAP/BN2VVewAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 24 Oct 2023 13:09:19 +0000
Date:   Tue, 24 Oct 2023 15:09:17 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        "Wilczynski, Michal" <michal.wilczynski@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Len Brown <lenb@kernel.org>, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: i801: Use new helper acpi_use_parent_companion
Message-ID: <20231024150917.79736389@endymion.delvare>
In-Reply-To: <e86fb57b-afc6-478b-9a9d-543b87bc8d3d@gmail.com>
References: <90bd1071-317e-4dfe-b94b-9bcee15d66c5@gmail.com>
        <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com>
        <206f0f25-8a83-4e53-89fd-cbe025e5798d@gmail.com>
        <66418e44-6862-4555-9280-2633ffb34d23@intel.com>
        <CAJZ5v0hfSZCgoW1mq=jeqjMBtsr=6JJaG8OWfUkAW80KF509Nw@mail.gmail.com>
        <e86fb57b-afc6-478b-9a9d-543b87bc8d3d@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Authentication-Results: smtp-out2.suse.de;
        none
X-Spam-Level: 
X-Spam-Score: -7.10
X-Spamd-Result: default: False [-7.10 / 50.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         MIME_GOOD(-0.10)[text/plain];
         NEURAL_HAM_LONG(-3.00)[-1.000];
         HAS_ORG_HEADER(0.00)[];
         DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
         NEURAL_HAM_SHORT(-1.00)[-1.000];
         RCPT_COUNT_SEVEN(0.00)[7];
         FREEMAIL_TO(0.00)[gmail.com];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[];
         BAYES_HAM(-3.00)[100.00%]
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner and all,

On Mon, 16 Oct 2023 22:05:51 +0200, Heiner Kallweit wrote:
> On 16.10.2023 19:32, Rafael J. Wysocki wrote:
> > On Mon, Oct 16, 2023 at 6:10=E2=80=AFPM Wilczynski, Michal
> > <michal.wilczynski@intel.com> wrote: =20
> >> On 10/15/2023 11:36 PM, Heiner Kallweit wrote: =20
> >>> Use new helper acpi_use_parent_companion to simplify the code.
> >>>
> >>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >>> ---
> >>>  drivers/i2c/busses/i2c-i801.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i=
801.c
> >>> index a41f5349a..ac223146c 100644
> >>> --- a/drivers/i2c/busses/i2c-i801.c
> >>> +++ b/drivers/i2c/busses/i2c-i801.c
> >>> @@ -1620,7 +1620,7 @@ static int i801_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
> >>>       priv->adapter.class =3D I2C_CLASS_HWMON;
> >>>       priv->adapter.algo =3D &smbus_algorithm;
> >>>       priv->adapter.dev.parent =3D &dev->dev;
> >>> -     ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&dev->dev=
));
> >>> +     acpi_use_parent_companion(&priv->adapter.dev); =20
> >>
> >> I think this case is a bit too trivial for a helper, it's one line bef=
ore, and
> >> one line after, so it doesn't really save much. =20

I must say I share Michal's skepticism.

> > If this pattern is repeated in multiple places, the helper makes sense =
IMO.
>=20
> I didn't check each usage in detail, but this should be the places where =
the new
> helper can be used.
> Another advantage IMO is that the helper, being a function instead of a m=
acro,
> is type-safe.

If type safety is a concern then I'd rather turn ACPI_COMPANION_SET to
an inline function (which would make more sense than a macro anyway
IMHO, as it has an intended side effect).

--=20
Jean Delvare
SUSE L3 Support
