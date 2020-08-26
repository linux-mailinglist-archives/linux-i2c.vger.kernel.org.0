Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D8D252B22
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 12:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgHZKJt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 06:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgHZKJj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Aug 2020 06:09:39 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C21C061756;
        Wed, 26 Aug 2020 03:09:38 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 67so781371pgd.12;
        Wed, 26 Aug 2020 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iHEsWvvTMNlzi3UKismS4T0pMykRpFFyVU3jPbBAjYs=;
        b=Q2uYkVQMXrVq3/6USoa/qReMoQU+pWI851jFMp3PhxTMaOZ/AbqKYQ154SAvyxNg9/
         XggvOhhBsKFYX7+x8LORzg9JERAd4sWgR6SG+5FaVHBbey5H26EtxCWWVZtSCPj0Y7fw
         Y+V5nl8lSbaC1L3YrC3pSHuyRUxbUqiydOaNUjLpKscWVyuqTpnm0jbO08o4adCrIc8G
         VWp7iHLmMnNjGf4dfY0IgzvfnnhK4UUk/YAvQ48KlIMbLzdWtR1HpmQC/Cz/fgYnk+sZ
         7mF/Vl3ebd1n0hPRapw8eBhlFglWhc9E9jOHiJe5qFOTEvE3WPKPDWu5RNKsCNHNI4PQ
         9QBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iHEsWvvTMNlzi3UKismS4T0pMykRpFFyVU3jPbBAjYs=;
        b=s+ZoLm6kjSbkx+tVh81VKmsN+jOgy452nev5ryBI9FbnAdO6UBBMwU5hvhT3SDTzK7
         TSQbV6a+MqY07vX0+qKAoUQX9nfWhJCbLaYnsJSa3Irt6aIl8ndI35fyVo2xwRFO13Of
         y9IktMGfsH3O0gnnE7j4Xziezxktm0yOvrJPAXCC5ygcFmmcpFF0B5VpUbAoR4YQHJ7f
         sqMAgra306ACTLv5u8xipHzM6pSKZgPPJTD5T/v9h4YZbNzbq+RV41u30k5Ccbp6WORZ
         zXSRoJZjNmP4rqBoKHFIuZO4Gj9hbIOwLI7Fz9zwSvW3MWFqQwNO0Z39blUBEDDSzIaU
         ucJw==
X-Gm-Message-State: AOAM533ZFBVdKEW8wOvjSvJuuOUBrUi8bpqMYarJqdOCNrRkcM6HqKSi
        0sANWoGjryXQX7OqZtBAENU=
X-Google-Smtp-Source: ABdhPJxY4Ti6Jljfc0G99zFAUhrGJKBo7hdD07Nhq8XuH3Qh0im2jFzwYu+D7Ot8nE6GiTWt4XUm7A==
X-Received: by 2002:aa7:96cf:: with SMTP id h15mr11590240pfq.294.1598436578235;
        Wed, 26 Aug 2020 03:09:38 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id u16sm2325227pfn.134.2020.08.26.03.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 03:09:37 -0700 (PDT)
Date:   Wed, 26 Aug 2020 19:09:35 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: consider devices with of_match_table during i2c
 device probing
Message-ID: <20200826100935.GB8849@jagdpanzerIV.localdomain>
References: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
 <20200826050851.GA1081@ninjato>
 <20200826052544.GA500@jagdpanzerIV.localdomain>
 <20200826095356.GG1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826095356.GG1891694@smile.fi.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On (20/08/26 12:53), Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 02:25:44PM +0900, Sergey Senozhatsky wrote:
> > On (20/08/26 07:08), Wolfram Sang wrote:
> > > On Wed, Aug 26, 2020 at 01:29:37PM +0900, Sergey Senozhatsky wrote:
[..]

> > > > i2c_of_match_device() depends on CONFIG_OF and, thus, is always false.
> > > > i2c_acpi_match_device() does ACPI match only, no of_comtatible() matching
> > > > takes place, even though the device provides .of_match_table and ACPI,
> > > > technically, is capable of matching such device. The result is -ENODEV.
> > > > Probing will succeed, however, if we'd use .of_match_table aware ACPI
> > > > matching.
> 
> Looks like you read same StackOverflow question :-)

Nope :) Ran into actual media/i2c driver probing issue several days ago

[..]
> >         if (!driver->id_table &&
> > -           !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
> > -           !i2c_of_match_device(dev->driver->of_match_table, client)) {
> > +           !(client && i2c_device_match(&client->dev, dev->driver))) {
> 
> You probably meant simply:
> 
> 	if (!i2c_device_match(dev, dev->driver)) {
> 
> >                 status = -ENODEV;
> >                 goto put_sync_adapter;
> >         }

That's shorter, yes. I wanted to keep the existing "workaround" in order
to avoid extra id_table matching. Because it probably will take place
earlier somewhere in

	bus_for_each_dev()
	 __driver_attach()
	  i2c_device_match()  // OF ACPI id_table match

> On the first glance it will work the same way but slightly longer in case of ID
> table matching.

Right.

	-ss
