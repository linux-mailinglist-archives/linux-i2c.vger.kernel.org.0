Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1828677B940
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 15:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbjHNNAm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 09:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbjHNNAO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 09:00:14 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0F610C0
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 06:00:07 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b9bb097c1bso64439701fa.0
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 06:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692018005; x=1692622805;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7A2aN9Pbagqbz4BsPp9+mJlzVeGzb9ayklH17tZ1Ks=;
        b=b0TkRg4LdGQjFzrj6oF3Y4Khc8ygvb03GJzmYubpSMdML2uUPKHAJXU7GAMEr2ovvH
         TFDjDOAYMW2UentPwdnIizHwrl25FNAyfAZIf45wAKo3E5saeJIUazwI5ifBUg7mcf8t
         bTlEHbO92ioX52aSzDnEyxpZlwthpufx53LqoTy2172Pvu1x64k5RLmNmSOeGkY0AoQw
         D33nqAL0G0M3eqNWB/lpbdD3kPPAuXHqntgHl1b+6PD70BLQJ5rfbZjyiLHbvjQGvWjF
         zm/VrydolRjI/+9czXWEgx7TD/k6fEQWNbLyFv+G1lutkVxKbscD8cmevMh929v0NDbW
         NEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692018005; x=1692622805;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7A2aN9Pbagqbz4BsPp9+mJlzVeGzb9ayklH17tZ1Ks=;
        b=dnnz/mbwNIEznWx4ObbFFk1GxJoKSL3eNrkIyH0vn3fL2n2Bfmq7Y+KQVnZrQ2wPyF
         PEDz59K7NgsMhcXH/zYvp/Swgz3aKclm7TbzFvDXHBEovHE2t9Qv4PmhVqFE9QEMmH4U
         IWzzf4CoAFGRRaSZqbJuS0NV3cE2T5JBtbF3ZAiDmSAbuYnt1Ad84gapuSpksw0FxWEA
         kYABiUUzt7aTX99q+1gzQg178dXJ2g1k/kbos395dxxXwaFNhSBo5IqIyclaqQLXr1mV
         mtzsA904k3Tm/3TISxGepnO/XhvrjGvj1OIFhYePKUUNtMnPiUbEkpZF/8uF4GF4LRa3
         1pug==
X-Gm-Message-State: AOJu0YzZhSluEeqwiCroUolfpby8I4BKYhUjn/fhGQzlUxraVfUiskok
        NF8D5mPbf1f5M4JNY/+/C3L/ls9jPNo=
X-Google-Smtp-Source: AGHT+IHWIIZjTUCT2Okj9tVJ4kmBlo8pCxiXZejfkDznFkNzPX3oFF1f6DCx5/ih3FDA24E4zl6C5A==
X-Received: by 2002:a2e:80c3:0:b0:2b9:bcac:7ba6 with SMTP id r3-20020a2e80c3000000b002b9bcac7ba6mr6018828ljg.46.1692018005200;
        Mon, 14 Aug 2023 06:00:05 -0700 (PDT)
Received: from daniel-Precision-5530 ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090681c800b0098e42bef736sm5723941ejx.176.2023.08.14.06.00.04
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 06:00:04 -0700 (PDT)
Date:   Mon, 14 Aug 2023 16:00:03 +0300
From:   Daniel Matyas <daniel.matyas23@gmail.com>
To:     linux-i2c@vger.kernel.org
Subject: [linux@roeck-us.net: Re: Functional enhancement of max31827]
Message-ID: <ZNolU5f/FrYyarfX@daniel-Precision-5530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
