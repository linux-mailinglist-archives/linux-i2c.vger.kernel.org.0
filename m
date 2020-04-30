Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974151C06AA
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Apr 2020 21:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgD3Tni (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Apr 2020 15:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgD3Tni (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Apr 2020 15:43:38 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEFE8C035494;
        Thu, 30 Apr 2020 12:43:37 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a21so588044ljb.9;
        Thu, 30 Apr 2020 12:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IVPO1xM0I+MDkYo8LpexsnbTaUjBHbEZMUn4h6d/yJk=;
        b=H64ch2SvQrHgGdkRdoGFyKcL0NNL6UBZ4YF6rouXideA5ODxK6YV2mWM9q3OtxSZnj
         JDI+j73tey4HDkUeGLPR9CPNYBfzCDBAAvU5R/EYY2CKyx39WyElp8Kod7QJcRs49iOM
         vespz3L9DCUqOPlJBuhssC7GReVLqoYDaDGFqCCpHTt3vhm3qcBtCG8DGh0zJfD0E5k2
         d2yyY6ugRdy7EgMLBNRf0nDtPxyZFyw7XXVy1Crc8Hkpnh3b1FZrmxBx9wLPSRco4ujb
         qhtPKQMsjrjQcmdOylXm/L4xb+nHK8YJhFaMxIGO/F7x8rHThWjYi1ATofsRU6/ZItvd
         conA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IVPO1xM0I+MDkYo8LpexsnbTaUjBHbEZMUn4h6d/yJk=;
        b=CNAAO8OQYP5QNIZD231SmsQJGPgGDcgiXLYX78d92/CKxNzH3nmpA/dEYz+Em0u2ng
         wDaHERhru6YFY62PwL0gDAXbQhWvEGCyTrFfDuA3CqoZ6Ml1fMNhb/SlDYmE/HKmqnGG
         z1ZkuTGgke7qyYVW06w6PltvXmmjqbILCfBl+njDRsnATxQ3OpfXC5gA6OSxmVdRh8w8
         9yyky9UVlqho/ARUgx9iDQeGjxc14gSU9BIBlNYaL5FX/1JAl4FLqYmUj8tdXwohKSGs
         uagozQjWVzBDeN/ZYyA7Tc3n3/R9bHue47B6ojPpJ1UA20ipbvjBtHDHgSvKKbXw+yhS
         iq2w==
X-Gm-Message-State: AGi0Puawq14PmQjSCX69LOc+apYDjftyKxan1z0jZbGpaSs0WhulL7rm
        0baNvC2m/bc9bmLloHghpHaxE9inB9uECm+3YNs=
X-Google-Smtp-Source: APiQypJEt61lgwTmnSrT4P29kwYjqJoFv6NFou83Lkw5kQqBtzOE9qSxWZMLhr0d4Fnp0XdwVergNcjiMGgWyM+ga3M=
X-Received: by 2002:a2e:731a:: with SMTP id o26mr290411ljc.189.1588275816438;
 Thu, 30 Apr 2020 12:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAC_JBqofuyRiSmK0mFqVLaY=5k9MYmjGaVmggx2dn_YjN8VOmw@mail.gmail.com>
 <20190910134242.GA6620@mwanda> <20200430141050.GB3355@ninjato>
In-Reply-To: <20200430141050.GB3355@ninjato>
From:   Elie Morisse <syniurge@gmail.com>
Date:   Thu, 30 Apr 2020 16:43:24 -0300
Message-ID: <CAC_JBqo4x0KBdb3j3VFrZu5sG2Mfx3xpbDzFk68h3TU99ZVj3Q@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: i2c-amd-mp2-pci: Fix Oops in amd_mp2_pci_init()
 error handling
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Yes I'm still here to review patches.

Sorry about this one, I replied to the v1 but in HTML so it bounced
back the ML and should have but didn't give my ack to the v2. I'll
make sure to give proper feedback to the latest versions of the
patches for the I2C MP2 driver in the future.

Elie

Le jeu. 30 avr. 2020 =C3=A0 11:10, Wolfram Sang <wsa@the-dreams.de> a =C3=
=A9crit :
>
> On Tue, Sep 10, 2019 at 04:42:42PM +0300, Dan Carpenter wrote:
> > The problem is that we dereference "privdata->pci_dev" when we print
> > the error messages in amd_mp2_pci_init():
> >
> >       dev_err(ndev_dev(privdata), "Failed to enable MP2 PCI device\n");
> >               ^^^^^^^^^^^^^^^^^
> >
> > Fixes: 529766e0a011 ("i2c: Add drivers for the AMD PCIe MP2 I2C control=
ler")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Applied to for-current, thanks!
>
> Elie, Nehal, Shyam, are you still there to review patches for this
> driver?
>
