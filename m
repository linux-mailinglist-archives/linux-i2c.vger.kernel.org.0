Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1696365B1
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 17:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238572AbiKWQZm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 11:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239001AbiKWQZg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 11:25:36 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B488F3FB
        for <linux-i2c@vger.kernel.org>; Wed, 23 Nov 2022 08:25:34 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id fz10so11549284qtb.3
        for <linux-i2c@vger.kernel.org>; Wed, 23 Nov 2022 08:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PhJSJnLVsP1vBula4KCFSx5kBTht7CuZrspFHU0N884=;
        b=ebGDyq+q12UGY7Qk5Tupc9qhDLGyIcTZVkm5UZYo/563kMYJJqyAeOt5CzUtM4J8DZ
         3trFHny8FIDylUgXR9JjN8PS72NcWsvrDfr1Nd1Q7FDnTR43onbW+jw1+Ctw0cwtwrCd
         T18F6CTTWbwHWY6WrhS9prZWxtXaTjwzs7IQnIsjaZTmFdCmKdzeecD0BbnuyMQqVQVg
         z0s4POzfjTxMQ62r8mCHZM0rSmjmaRN4hzlYV7zdZbP1xMXxym5gxZ3SKz4kt6tgYYum
         EfCUt6/g2D4WDco0MNWeSPD0NJ6lencxZ7NqZJCJlD8ikZ4WiUl7N0yJnMd2Q4wIPSG2
         7pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhJSJnLVsP1vBula4KCFSx5kBTht7CuZrspFHU0N884=;
        b=pWFlp3O0MqwBKN6X9e/GR9cZlHMtN3ENCD90UIKSDVe5fx7XDXNy4DI6cx0hx/tdqI
         nKHgf1JpxZz2JA0OnmLjIImLTu3UNL3QqXo2Zt+flDPvHIRXsSpjx31e7REH4+8iGLv/
         OnWsbI+xp5J8vUXivicxgvAdEn6WCfhBppdNjXM8zIzfjcJvCRc5vv3YuL4X+Qmao1cC
         89FNawolxPzqBBzEL4y5FGsyxdslzvfBKYXaBtwV+Rtuxf+eOHYxhcWZ0p4OXMAi1+g7
         obxH6d65IsMfs1nBlf/KGx/44+fuqC1JuDlfTInYq11IJhvR4lBog6nBgsnahhq82RFU
         K8fw==
X-Gm-Message-State: ANoB5plLCGjX+14l3x2a3OyCeWqrgnwqaFQz+KQT/NdxwDGDLc7Nw9uj
        /M0q0/nciSXp6mgDdOnqrnhCuQ==
X-Google-Smtp-Source: AA0mqf7URgWK3LZKBiCOJvrYX2BcRTBThzd2VlaYXoILbXTQHzjAWJMWnGzlcI0wVuCFvjEWzX6GjA==
X-Received: by 2002:ac8:60c:0:b0:3a6:37bd:ace5 with SMTP id d12-20020ac8060c000000b003a637bdace5mr14127789qth.426.1669220734011;
        Wed, 23 Nov 2022 08:25:34 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id q7-20020a05620a0d8700b006f8665f483fsm12561497qkl.85.2022.11.23.08.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 08:25:33 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1oxsZ2-00AOLL-MZ;
        Wed, 23 Nov 2022 12:25:32 -0400
Date:   Wed, 23 Nov 2022 12:25:32 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Wolfram Sang <wsa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        Ming Lei <ming.lei@redhat.com>,
        Jilin Yuan <yuanjilin@cdjrlc.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ira Weiny <ira.weiny@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y35JfNJDppRp5bLX@ziepe.ca>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y34+V2bCDdqujBDk@kroah.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 23, 2022 at 04:37:59PM +0100, Greg Kroah-Hartman wrote:
> static inline struct device *__kobj_to_dev(struct kobject *kobj)
> {
>         return container_of(kobj, struct device, kobj);
> }
> 
> static inline const struct device *__kobj_to_dev_const(const struct kobject *kobj)
> {
>         return container_of(kobj, const struct device, kobj);
> }
> 
> /*
>  * container_of() will happily take a const * and spit back a non-const * as it
>  * is just doing pointer math.  But we want to be a bit more careful in the
>  * driver code, so manually force any const * of a kobject to also be a const *
>  * to a device.
>  */
> #define kobj_to_dev(kobj)                                       \
>         _Generic((kobj),                                        \
>                  const struct kobject *: __kobj_to_dev_const,   \
>                  struct kobject *: __kobj_to_dev)(kobj)
> 
> 
> Want me to do the same thing here as well?

It would be nice to have a shared macro code gen all of the above
instead of copy and pasting it. Then maybe other cases beyond struct
device could adopt const too..

Jason
