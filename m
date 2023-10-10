Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B20C7C4527
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 00:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjJJW7h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Oct 2023 18:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbjJJW7g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Oct 2023 18:59:36 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF789D;
        Tue, 10 Oct 2023 15:59:30 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c87a85332bso51846805ad.2;
        Tue, 10 Oct 2023 15:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696978770; x=1697583570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ES8C0x5ZuDNWr0HT9HpTOQqsYOU0+uKuBS01OB1ZoI=;
        b=GpntdHK+21sDzhg0enY9S+FepIl1WszrF/Nm5Z+0HneQG0e17PxPTLCfAtIMCjBQG5
         9n7nE3XAuO3FDxlQW2XgCeQm5xVnthPx4qLJuGjrDAq+kxTgTfEhbHpGCiRjLWLdhfjt
         9cyndqyq5o/th3jo49IqhMSoyXtSyXMB7wbOrS/DdSHSy9DD55baJl1dD/S53J0/A+6D
         PYhVKIgUWhIEagp3qNGRJpFbwOrikcZpk1dAaQLVPawMZYNtJn+ue1PDZ5cbsWMqsIS4
         vOEpyY/QIb/Oacu22Pe8K8iwThIvUgccHrc32wLb1Wh1h+x9GVR6pJSaYKJOrIZiyY3S
         mWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978770; x=1697583570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:sender:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/ES8C0x5ZuDNWr0HT9HpTOQqsYOU0+uKuBS01OB1ZoI=;
        b=KNoNg42VjK4/MlBH5C8VCHiQn2eeuRAXN3+ID45xdiFX8O5dhyEXIznKyp4NLC09bH
         ZJfq2CZqGgStdi1XM+myfLEWhQnndI+xzA5+9pSAm1V7o5O0S8jYqfm/KXIWY3P1kk+1
         O+ZT54EQ5I/oxDoyrmfuJMx2/W1tf1b6GaifbhApm5Q7wpuIo/JbgB1KQvYZecVJWc6K
         AUVtpOLmW8j81RM4+l0k9xu1B1Ehqo3abt0++F1oMxlv7dwGewk6uDYQywoC2NuzyHMA
         n6ywI0mGS040Z0NjSo+VuP3KSB4W1aJR0ya2dDjxDRyprrSD5+YOKUrqie4bQ75oeqOc
         +WRg==
X-Gm-Message-State: AOJu0Yy79TNBvAqBhuvIyDczrQtUdfjU19+KHGOW1O6VMkmbVPhfiPsU
        xS6x3ykSJRzSwMPFwi1zv8Q=
X-Google-Smtp-Source: AGHT+IEtF2lTqZZ7UjLFlrsQ5S9tyJm76ONM8BvApkxciRNKIFFX8vAoR8+YfD2KoSXBJPg85G0uIg==
X-Received: by 2002:a17:903:228f:b0:1c7:1fbc:b9e7 with SMTP id b15-20020a170903228f00b001c71fbcb9e7mr22885106plh.43.1696978770109;
        Tue, 10 Oct 2023 15:59:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w7-20020a170902d3c700b001c42d4b3675sm12216597plb.309.2023.10.10.15.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:59:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 10 Oct 2023 15:59:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa@kernel.org>,
        Lakshmi Yadlapati <lakshmiy@us.ibm.com>,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        jdelvare@suse.com, joel@jms.id.au, andrew@aj.id.au,
        eajames@linux.ibm.com, ninad@linux.ibm.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-hwmon@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 0/2] [PATCH] hwmon: (pmbus/max31785) Add minimum delay
 between bus accesses
Message-ID: <125cac30-b83d-4530-885b-5008fc3045af@roeck-us.net>
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
 <ZSUaDIfWmEn5edrE@shikoro>
 <1284830f-025e-4e25-8ed0-50a6cc00d223@roeck-us.net>
 <ZSWevlHzu6kVcGWA@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSWevlHzu6kVcGWA@shikoro>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 10, 2023 at 08:58:06PM +0200, Wolfram Sang wrote:
> Hi Guenter,
> 
> > > > Reference to Andrew's previous proposal:
> > > > https://lore.kernel.org/all/20200914122811.3295678-1-andrew@aj.id.au/
> > > 
> > > I do totally agree with Guenter's comment[1], though. This just affects
> > > a few drivers and this patch is way too intrusive for the I2C core. The
> > > later suggested prepare_device() callback[2] sounds better to me. I
> > > still haven't fully understood why this all cannot be handled in the
> > > driver's probe. Could someone give me a small summary about that?
> > > 
> > 
> > Lots of PMBus devices have the same problem, we have always handled
> > it in PMBus drivers by implementing local wait code, and your references
> > point that out.
> 
> I am confused now. Reading your reply:
> 
> "I am not sure if an implementation in the i2c core is desirable. It
> looks quite invasive to me, and it won't solve the problem for all
> devices since it isn't always a simple "wait <n> microseconds between
> accesses". For example, some devices may require a wait after a write
> but not after a read, or a wait only after certain commands (such as
> commands writing to an EEPROM)."
> 
> I get the impression you don't prefer to have a generic mechanism in the
> I2C core. This I share. Your response now sounds like you do support
> that idea now?
> 

I didn't (want to) say that. I am perfectly happy with driver specific
code, and I would personally still very much prefer it. I only wanted to
suggest that _if_ a generic solution is implemented, it should cover all
existing use cases and not just this one. But, really, I'd rather leave
that alone and not risk introducing regressions to existing drivers.

> > What other summary are you looking for ?
> 
> What the actual problem is with these devices. The cover letter only
> mentions "issues with small command turn-around times". More details
> would be nice. Is it between transfers? Or even between messages within
> one transfer? Has it been tried to lower the bus frequency? Stuff like
> this.
> 

I don't know about this device, but in general the problem is that the
devices need some delay between some or all transfers or otherwise react
badly in one way or another. The problem is not always the same.
Lower bus frequencies don't help, at least not for the devices where
I have seen to problem myself. The issue is not bus speed, but time between
transfers. Typically the underlying problem is that there is some
microcontroller on the affected chips, and the microcode is less than
perfect. For example, the microcode may not poll its I2C interface
while it is busy writing into the chip's internal EEPROM or while it is
updating some internal parameters as result of a previous I2C transfer.

> > On a side note, if anyone plans to implement the prepare_device() callback,
> > please make sure that it covers all requirements. It would be unfortunate
> > if such a callback was implemented if that would still require per-driver
> > code (besides the callback).
> 
> Is there a list of that somewhere? Or does it mean going through all the
> drivers and see what they currently do?
> 

The latter. I never bothered trying to write up a list. Typically the behavior
is not documented and needs to be tweaked a couple of times, and it may be
different across chips supported by the same driver, or even across chip
revisions. Any list trying to keep track of the various details would
be difficult to maintain and notoriously be outdated.

Guenter
