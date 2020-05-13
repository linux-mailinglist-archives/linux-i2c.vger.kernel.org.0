Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0F81D12A2
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 14:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbgEMM2z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 08:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbgEMM2y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 May 2020 08:28:54 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C06C061A0C;
        Wed, 13 May 2020 05:28:54 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id i22so4637218oik.10;
        Wed, 13 May 2020 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X+YMEnNGHIRHv5i2pgJP6CvjowaQ7wp0v7KSyBmjqZg=;
        b=onvfodWQlZcqrfWAvLT92NRwFi3+YT5iv65aStLrJZR0Z37RjR+kb0qQas8E5QafYc
         XSm/Rd5SQDM905szt1AV++k41Dq1HgwfL3Io61Wri0mQ4jCSzeNLtloDzS8j+FF/ZvLc
         63N4WeS6GR438bITwrAP9oT/9rHp0Fvxoa2tzCZoQ68EZren+X5TBZ8O9y+q2UNgghh+
         tngvpieVNVdinoma2EEVAs6pGK2minA0Rnvhto36+DpjM82Ns7ypC3d78xbOvKrLNTo2
         RsbmrNOQ8IaA9Eo91CRoD5TZT5YzbaFVatapevo7V7ENt7aX7icmphVe1SGEFHXmS/XC
         tooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to
         :user-agent;
        bh=X+YMEnNGHIRHv5i2pgJP6CvjowaQ7wp0v7KSyBmjqZg=;
        b=dN66iWcb1x+9pUccBoi/T7TbVIBsQ014Pi1vuFkqaXOxfp5tAA7RraxAzWNr/buM6V
         xFha8R4tnYvLFmPIYCUPSzvOnbAfqPgjk/YQJNFoEOTSkH7+EWNB6n+K4rQPMDLlNzyh
         vKlZKbC6WBgwepE/l9c1mFOF4vjQnzGjMz2Cgci0q2FdPacPRQk62YfcmTSNYuyEKSb4
         8UUCBx/vjkHZtZKF4KM3B2A3/lmTVKFYiwrsA1X5FJD/CsiT1NmZO8J4jumtTmfKh+Nb
         KimS6o2NWN1TuxZzJE2/3DpiCHGsus2lInSlkWn9ianaHiBAsJaXL2i6A6iO8kQYQBix
         xMtQ==
X-Gm-Message-State: AGi0PuawNlx++odVUU0wLmfYsB2eWdkEteDBazdsgmCN/EF7hUe18+df
        VmSsOzra+ld8xfkDNZ18XGM4R50=
X-Google-Smtp-Source: APiQypJrccrVkQAAcpRmapFbtFU/9vMh8lVpj0epLTDOYnKFYgpoevntivaAzvcs6IzA0P5gwNawjw==
X-Received: by 2002:aca:dc82:: with SMTP id t124mr11220213oig.160.1589372933933;
        Wed, 13 May 2020 05:28:53 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id v3sm4200611ote.39.2020.05.13.05.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 05:28:53 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
        by serve.minyard.net (Postfix) with ESMTPSA id ECF3A180042;
        Wed, 13 May 2020 12:28:51 +0000 (UTC)
Date:   Wed, 13 May 2020 07:28:50 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] char: ipmi: convert to use i2c_new_client_device()
Message-ID: <20200513122850.GT9902@minyard.net>
Reply-To: minyard@acm.org
References: <20200326210958.13051-1-wsa+renesas@sang-engineering.com>
 <20200326210958.13051-2-wsa+renesas@sang-engineering.com>
 <20200512211425.GQ9902@minyard.net>
 <20200513071004.GA1043@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513071004.GA1043@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 13, 2020 at 09:10:04AM +0200, Wolfram Sang wrote:
> 
> > > -	addr_info->added_client = i2c_new_device(to_i2c_adapter(adev),
> > > -						 &addr_info->binfo);
> > > +	addr_info->added_client = i2c_new_client_device(to_i2c_adapter(adev),
> > > +							&addr_info->binfo);
> > 
> > i2c_new_client_device returns an ERR_PTR, not NULL on error.  So this
> 
> Yes, this is the main motivation for the new API.
> 
> > needs some more work.  I'll send something out soon.
> 
> Why does it need that work? 'added_client' is only used with
> i2c_unregister_device() which has been fixed to handle ERR_PTR as well.
> Or am I missing something?
> 

No, I didn't look to see if i2c_unregister_device could handle that.

-corey
