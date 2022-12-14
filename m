Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 729D264C898
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 13:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237771AbiLNMBO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 07:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238230AbiLNMAx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 07:00:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBC91B9EF
        for <linux-i2c@vger.kernel.org>; Wed, 14 Dec 2022 04:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671019205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ORJ82nUqgmRWHPSLvhoNWLJ0+9bS/SAj60kUH3rLBhw=;
        b=MOSMM2kQrAq1q5srvZDDwdIkI0kfgkP3iBsd3xG0sH3INj/YYTleJaHF0vF9AYp0InRWve
        zZ/yuugfEnWUZ5UbXPf6/nDhbsmE6RZTb4iH/+crITKqoB24chZ0l5o+SO4OI/QyuVhKgT
        cdNHN58jctER5OtWQLIdPakLcTQ656M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-157-X6RrdWntOw6YnfYy4s9ZRw-1; Wed, 14 Dec 2022 07:00:04 -0500
X-MC-Unique: X6RrdWntOw6YnfYy4s9ZRw-1
Received: by mail-wm1-f70.google.com with SMTP id g9-20020a7bc4c9000000b003d214cffa4eso4092584wmk.5
        for <linux-i2c@vger.kernel.org>; Wed, 14 Dec 2022 04:00:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORJ82nUqgmRWHPSLvhoNWLJ0+9bS/SAj60kUH3rLBhw=;
        b=fuKFd0l060Vuz9LlAYxEzTdoyENFGSQR+LbHReLYZKGcT9dlWAHg1hMgdpoyJ/uDHz
         RiDeXRGBNZWO4+OTsUDAs2vN9tKlPWCXdbBzRADndh+pA5k8REpRIDbczmFQxnyF7byK
         GR8/iHERL35dSoxDOPFZee17i9RGU572MwsASrtTNtQimUv1wip93qEA3v4ZmoJZir/6
         cX2+2+vTi9R/tCtkh91Y5cB+ngBRLqTdNlzh9KJijDECWAc7QUysTrJmbrlI5ppYjjPd
         C/c4RTdND3+HHuYJ+k7vWvZsG+cRAo7rSNv+cCR9w4xDb0nQpROFMHjkAhhhz2qx+Pg8
         v5+Q==
X-Gm-Message-State: ANoB5pk/rDseY9762M9ud0y+HypmfVy95xxEfsfn38JPHd8sdxUYmy6I
        YRmbdr80MLrLPQXraHQNAKH27l8nLfguC/701vxbHdRScaWtVTFk34ih85AhaQAqhikSLqhcEbK
        pdeKHMuMKlNeu0zBhPfOL
X-Received: by 2002:a5d:464d:0:b0:242:19ba:c325 with SMTP id j13-20020a5d464d000000b0024219bac325mr14267619wrs.30.1671019203203;
        Wed, 14 Dec 2022 04:00:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf70rUn2JP0a8uV9qrEQRacU9eDMVqCZ636ZVH7ao6T+VGi+4vl1vzH82Lks4swv/K9ZhapOSw==
X-Received: by 2002:a5d:464d:0:b0:242:19ba:c325 with SMTP id j13-20020a5d464d000000b0024219bac325mr14267609wrs.30.1671019202999;
        Wed, 14 Dec 2022 04:00:02 -0800 (PST)
Received: from redhat.com (bzq-82-81-161-50.red.bezeqint.net. [82.81.161.50])
        by smtp.gmail.com with ESMTPSA id l7-20020a5d6687000000b002425787c5easm2609121wru.96.2022.12.14.04.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 04:00:02 -0800 (PST)
Date:   Wed, 14 Dec 2022 07:00:00 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, asowang@redhat.com,
        Conghui <conghui.chen@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Jian Jun Chen <jian.jun.chen@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Update maintainer list for virtio i2c
Message-ID: <20221214065856-mutt-send-email-mst@kernel.org>
References: <20221214053631.3225164-1-conghui.chen@intel.com>
 <20221214063107.fazrfq3n26hw4ndl@vireshk-i7>
 <Y5mjcuCRP45ynJis@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5mjcuCRP45ynJis@shikoro>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 14, 2022 at 11:20:34AM +0100, Wolfram Sang wrote:
> Hi Viresh,
> 
> > I understand that it is okay to pass the maintainership, within the
> > company, for platform specific parts from one person to another, since
> > they have the best knowledge of the code and are the only one
> > interested in maintaining it too.
> > 
> > But what is the rule for generic drivers like this one ?
> 
> Dunno if this is really a rule, but if a maintainer steps out and makes
> sure there is someone to pick up the work, this is more than welcome.
> Way better than a stale entry in the MAINTAINERS file.
> 
> I mean, it does not limit the chance to have further maintainers, for
> example. I believe in meritocracy here. Those who do and collaborate,
> shall get responsibility.

Exactly. I'd like to see Jian Jun Chen do and collaborate first.

> If not, then not. We can fix this, too, if
> needed.
> 
> What is the reason for your question?
> 
> All the best,
> 
>    Wolfram
> 


