Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1C22774943
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 21:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233253AbjHHTus (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Aug 2023 15:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233961AbjHHTu1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Aug 2023 15:50:27 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870F153509;
        Tue,  8 Aug 2023 09:56:09 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RKxV54TDFz6GD4v;
        Tue,  8 Aug 2023 23:11:25 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 16:16:20 +0100
Date:   Tue, 8 Aug 2023 16:16:19 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org\" <linux-renesas-soc@vger.kernel.org>"@domain.invalid
Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
 bus_type
Message-ID: <20230808161619.00000b92@Huawei.com>
In-Reply-To: <ZNFV+C1HCIRJpbdC@google.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
        <20230805174036.129ffbc2@jic23-huawei>
        <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
        <20230806142950.6c409600@jic23-huawei>
        <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
        <ZNFV+C1HCIRJpbdC@google.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 7 Aug 2023 13:37:12 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> On Mon, Aug 07, 2023 at 05:54:07PM +0300, Andy Shevchenko wrote:
> > On Sun, Aug 06, 2023 at 02:29:50PM +0100, Jonathan Cameron wrote:  
> > > On Sat, 5 Aug 2023 17:42:21 +0000
> > > Biju Das <biju.das.jz@bp.renesas.com> wrote:  
> > > > > On Fri,  4 Aug 2023 17:17:24 +0100
> > > > > Biju Das <biju.das.jz@bp.renesas.com> wrote:  
> > 
> > ...
> >   
> > > > + * Besides the fact that some drivers abuse the device ID driver_data type
> > > > + * and claim it to be integer, for the bus specific ID tables the driver_data
> > > > + * may be defined as kernel_ulong_t. For these tables 0 is a valid response,
> > > > + * but not for this function. It's recommended to convert those either to avoid
> > > > + * 0 or use a real pointer to the predefined driver data.  
> >   
> > > We still need to maintain consistency across the two tables, which
> > > is a stronger requirement than avoiding 0.  
> > 
> > True. Any suggestion how to amend the above comment? Because the documentation
> > makes sense on its own (may be split from the series?).
> >   
> > > Some drivers already do that by forcing the enum used to start at 1 which
> > > doesn't solver the different data types issue.  
> > 
> > And some maintainers do not want to see non-enum values in i2c ID table.
> > *Shrug*.  
> 
> So in legacy ID lookup path we can safely assume that values below 4096
> are scalars and return NULL from the new device_get_match_data(). This
> way current drivers using the values as indices or doing direct
> comparisons against them can continue doing manual look up and using
> them as they see fit. And we can convert the drivers at our leisure.

Good idea.  Though I suspect there may still be nasty cases. People have
been known to put chip ID values in these fields so that they can then
match them against a who am I register as a 'detect it's the right part' check.

No idea if we have any drivers doing that but if there are hopefully not too many!

Jonathan

> 
> Thanks.
> 

