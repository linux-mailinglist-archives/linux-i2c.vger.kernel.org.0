Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64A29772FBF
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Aug 2023 21:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjHGTqX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Aug 2023 15:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjHGTqX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Aug 2023 15:46:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5722121;
        Mon,  7 Aug 2023 12:45:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ECC2C619F1;
        Mon,  7 Aug 2023 19:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB52C433C8;
        Mon,  7 Aug 2023 19:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691437513;
        bh=/H/K+rkMsK2omYcW/qNUyfid3VGJ1y+Y1xoeTLm/UbI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sxFyG8N9964gi9g8QW6N5rJAxP0itZZ/ve4N117v75OWaFcQ9txqbuE01zhwi/8An
         NfQtGMdibXgTxPceDDcIdPiw5lakYwPTa1kjXd40wWpZR2F3xgWkpKfzWSAwqUWoto
         YxRXFU5hVZrL4bKbKqioF7gNaDTFztQSxNjz3XkPCNdRzNqerqizEB3pWpIaeW+a3m
         O2q7GihLcL0OzmxhmkejNmNe9QQmjHbaAUHgASKSWkmkWAeOe1GZjXasalj4hdH+u3
         MQhW74jV5/OWlov+1qBVRxTHjL+pnRGhuVDDxsPPDjUGNYWIeSeCszUDGuJhI0OXZL
         EjaQnYcY1lAbA==
Date:   Mon, 7 Aug 2023 20:45:05 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
 bus_type
Message-ID: <20230807204505.5f3f245e@jic23-huawei>
In-Reply-To: <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
        <20230805174036.129ffbc2@jic23-huawei>
        <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
        <20230806142950.6c409600@jic23-huawei>
        <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 7 Aug 2023 17:54:07 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Sun, Aug 06, 2023 at 02:29:50PM +0100, Jonathan Cameron wrote:
> > On Sat, 5 Aug 2023 17:42:21 +0000
> > Biju Das <biju.das.jz@bp.renesas.com> wrote:  
> > > > On Fri,  4 Aug 2023 17:17:24 +0100
> > > > Biju Das <biju.das.jz@bp.renesas.com> wrote:  
> 
> ...
> 
> > > + * Besides the fact that some drivers abuse the device ID driver_data type
> > > + * and claim it to be integer, for the bus specific ID tables the driver_data
> > > + * may be defined as kernel_ulong_t. For these tables 0 is a valid response,
> > > + * but not for this function. It's recommended to convert those either to avoid
> > > + * 0 or use a real pointer to the predefined driver data.  
> 
> > We still need to maintain consistency across the two tables, which
> > is a stronger requirement than avoiding 0.  
> 
> True. Any suggestion how to amend the above comment? Because the documentation
> makes sense on its own (may be split from the series?).

For bus ID tables it is fine right now as long as no one checks for NULL.
I guess adding this to the i2c_get_match_data and spi equivalent wrapper
functions might avoid someone shooting themselves in the foot (I've done it
for starters more than once).

> 
> > Some drivers already do that by forcing the enum used to start at 1 which
> > doesn't solver the different data types issue.  
> 
> And some maintainers do not want to see non-enum values in i2c ID table.
> *Shrug*.
> 

That leaves us stuck unless we move to a form where the i2c ID table isn't
used if there is an of_device_id table (or maybe we invent yet another table
and if that is present it is used for dt and were i2c_device_id is used and
hence becomes an opt in?  That will also be tricky however.

Jonathan
