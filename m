Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15F177CB162
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 19:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbjJPRcn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 16 Oct 2023 13:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233580AbjJPRcn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 13:32:43 -0400
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6D89F;
        Mon, 16 Oct 2023 10:32:41 -0700 (PDT)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-57ddba5ba84so392305eaf.0;
        Mon, 16 Oct 2023 10:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697477561; x=1698082361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQp7jMcfyyRCN1wY+v8LGuAQYjTYb3WC+VTe+hPBaic=;
        b=vVa2lDrNWW2ULmneI9wAqjmwSe50kKhTTj6FwiSHaE2ecbu4OupvF6wfbsshZtzvmA
         02FEqFmsde+B2tWstlRsWwpofN1/YhpdZZVEoVyNdxFjhuQxkRbcqaEJtHoVlf0p5yWW
         pTlQe2vfdTf5VpEYN8Yxm6+9OiXUboujOH/6t8ERy5cAfJOlykRzFAG1JPgux4sW2UBz
         pyVLeDWfqwvoQC67JDOsLGc0dwuBkKJ3GWn2NY9D78uVmcVwYAnOKD/iDEu/jaeLwnvT
         3q6KV5+x7xpEYFlAXxsTYNfGNne6nu51UHUg88PFKst8Kl2xf4J+cZgbDKv3KOqufdB/
         8klA==
X-Gm-Message-State: AOJu0YwoOHetT1ML/FpIoE9lFsEc7DAurF2ZX31/GqL5xAQe8yQClffd
        /aB7wl+dJ/qtE25TL1/+6GcdoJupQc/6pQvMSmM6Km4v
X-Google-Smtp-Source: AGHT+IHahk+crEjN+AR0VRCmBIzdYS9IT1aUZbZFKN+ad+Gel9z6XTOF/5FLyzPD5mFvp3tJUAjtSbXf2ZBnKvLiuM4=
X-Received: by 2002:a4a:b588:0:b0:578:c2af:45b5 with SMTP id
 t8-20020a4ab588000000b00578c2af45b5mr32268569ooo.0.1697477561161; Mon, 16 Oct
 2023 10:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <90bd1071-317e-4dfe-b94b-9bcee15d66c5@gmail.com>
 <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com> <206f0f25-8a83-4e53-89fd-cbe025e5798d@gmail.com>
 <66418e44-6862-4555-9280-2633ffb34d23@intel.com>
In-Reply-To: <66418e44-6862-4555-9280-2633ffb34d23@intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 16 Oct 2023 19:32:25 +0200
Message-ID: <CAJZ5v0hfSZCgoW1mq=jeqjMBtsr=6JJaG8OWfUkAW80KF509Nw@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: i801: Use new helper acpi_use_parent_companion
To:     "Wilczynski, Michal" <michal.wilczynski@intel.com>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 16, 2023 at 6:10 PM Wilczynski, Michal
<michal.wilczynski@intel.com> wrote:
>
> Hi,
>
> On 10/15/2023 11:36 PM, Heiner Kallweit wrote:
> > Use new helper acpi_use_parent_companion to simplify the code.
> >
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-i801.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > index a41f5349a..ac223146c 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -1620,7 +1620,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >       priv->adapter.class = I2C_CLASS_HWMON;
> >       priv->adapter.algo = &smbus_algorithm;
> >       priv->adapter.dev.parent = &dev->dev;
> > -     ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&dev->dev));
> > +     acpi_use_parent_companion(&priv->adapter.dev);
>
> I think this case is a bit too trivial for a helper, it's one line before, and
> one line after, so it doesn't really save much.

If this pattern is repeated in multiple places, the helper makes sense IMO.

>
> >       priv->adapter.retries = 3;
> >
> >       priv->pci_dev = dev;
>
