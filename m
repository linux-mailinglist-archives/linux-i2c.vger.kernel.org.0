Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A36D87684CF
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jul 2023 12:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjG3KX6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jul 2023 06:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjG3KX5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Jul 2023 06:23:57 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C10719A8
        for <linux-i2c@vger.kernel.org>; Sun, 30 Jul 2023 03:23:56 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31771bb4869so3778215f8f.0
        for <linux-i2c@vger.kernel.org>; Sun, 30 Jul 2023 03:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690712635; x=1691317435;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7A2aN9Pbagqbz4BsPp9+mJlzVeGzb9ayklH17tZ1Ks=;
        b=SG6X5BfJEPqT/zYWG9xXVSZQWYys/qTXt/f0/9VlR0JsHg0m/zytpSJPSsoe6fPrg1
         3SiqeVAYTrovsA5FlaH4/wf8PBk3WepKIoUdMLF2EHeF4Znnn17WhsNez53DnddygprZ
         DzFQqiGeLMr5q7zk0coS80JiWlHdR8EX197uWcmrtgp/EK6n1yGVCjzBWxvoL4U1alBn
         ROamBVkUp7aXs1gOP683KZizLHptXr4IPhvKV6qJ2Aut3n5V2739aZWZ3aX2NeOP3ZyO
         OJIUrKy4jiX4o3THiYffbxVK3pwBfsdV67Y3KOUizboiPdaWpGcmBKxVZDzG3DYPzo0L
         JVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690712635; x=1691317435;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7A2aN9Pbagqbz4BsPp9+mJlzVeGzb9ayklH17tZ1Ks=;
        b=jmU/B9sKOSKBOd5unP2YvJRwDL0450Whkbebwean4YQDqJVC/FxsbCwDLvbt9JH+SJ
         aakLHQBDQofJDCQcwDWwUY5W5bCzgsaNAwJNeWV/ATg+i9sU8tokV0V9Ov7aQc5bjAyc
         qeYTIoOnCSQJnFpVmO14Nf5fCQGPQ184LiX9YfwUEVqthQ+Igri1m+bz8uFRu2w5Lw1P
         PG82gJzj9R8+jevNlbD9f4E4pvGH72KRdj81sIAf8Irrmq0ASD87D7L99SturJi1dY2q
         3EupHq0JKwcqzwVX1Kf/TC+0/b6SnF++fpe5lZivb8lFt66b1uEpItYIXRRlJPrMYnAd
         V59w==
X-Gm-Message-State: ABy/qLYuhCGBwZApUDUwU7zColvXN5Q4PPOA+OScPqYRH57cLkejco0b
        /hZmwlswFnv0TK1quzXnYRm2Qm8OT9Q=
X-Google-Smtp-Source: APBJJlGk3L/Tcd7k3WkgyZaWgIIRf/i5KymDSZ7Hotzfz/DzT1YvFNA6YWsGNzF8RTgOCA3kOy2m3g==
X-Received: by 2002:adf:e70d:0:b0:317:6704:72c with SMTP id c13-20020adfe70d000000b003176704072cmr4016166wrm.52.1690712634773;
        Sun, 30 Jul 2023 03:23:54 -0700 (PDT)
Received: from daniel-Precision-5530 ([82.77.127.140])
        by smtp.gmail.com with ESMTPSA id d4-20020adfe884000000b003144b95e1ecsm9726270wrm.93.2023.07.30.03.23.50
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 03:23:54 -0700 (PDT)
Date:   Sun, 30 Jul 2023 13:23:38 +0300
From:   Daniel Matyas <daniel.matyas23@gmail.com>
To:     linux-i2c@vger.kernel.org
Subject: [linux@roeck-us.net: Re: Functional enhancement of max31827]
Message-ID: <ZMY6KtQDin4wOCZg@daniel-Precision-5530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

----- Forwarded message from Guenter Roeck <linux@roeck-us.net> -----

Date: Sat, 29 Jul 2023 07:25:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Matyas <daniel.matyas23@gmail.com>, linux-hwmon@vger.kernel.org
Subject: Re: Functional enhancement of max31827
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Thunderbird/102.13.0

On 7/27/23 23:49, Daniel Matyas wrote:
> Dear hwmon community,
> 
> I developed the driver for the max31827 temperature sensor, but when
> doing so I omitted some functionalities of the chip, namely: PEC Error,
> Fault Queue, Comp/Int, Alarm Polarity, Resolution, Timeout and PEC
> Enable. I did not implement these, because there are no predefined
> attributes in the linux kernel which have similar meaning to these
> funcionalities.
> 
> I recently got a request from the client to implement these
> functionalities. I want to use SENSOR_DEVICE_ATTR to implement these. I
> did some reading and saw that using debufs is also a possibility.
> 
> I would be really greatful, if you could provide me with some advices.
> Should I proceed with device attributes defined by me? Should I use
> debufs? Maybe there is another and better way...
> 

pec related attributes should be attached to the i2c interface. Other
drivers already do that; look for pec_{show,store}. The same is true
for timeout.

Comp/Int and Alarm polarity are system properties which should be set
via devicetree.

For others I am not sure. Fault Queue also smells like a system property
since normally one would only modify it if a given system requires it
(for example because the sensors are noisy). The same is true for sensor
resolution, though that one is closest for considering a sysfs attribute.
For most sensors, the resolution is closely related to conversion time
and can be handled with that attribute. I think that isn't the case here,
and there are numerous chips where the resolution is configurable, so it
may make sense to consider a sysfs attribute.

Guenter


----- End forwarded message -----
