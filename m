Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 010C6124E0
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2019 00:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfEBW7P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 May 2019 18:59:15 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40697 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfEBW7P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 May 2019 18:59:15 -0400
Received: by mail-oi1-f196.google.com with SMTP id y64so3084541oia.7;
        Thu, 02 May 2019 15:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AmMJvvqepFQ5FHhs6fnEWr1vFGhqHnFVdKxKjcKH6a4=;
        b=lYGN5u3UrNDWpzULcNN9d1p0UrAFqtE3esM8eOVv6AwDw+bAC03dZVwqCIvE5/Ik2k
         6pZAfZAU2YVG+SkHXay5xUaWpLN87MFck5zdsLX4DpfjudEH/VmeR3CoPeFQdF+E8Sz1
         mXZQka7ySmS0niH6abC6mJhMG5fxGwXHfTeTvUSG5fsdcEtA+iSxke7dPGe6viu/bwxy
         liGscJWr/OzDwf42DN9fIVcQjphxUEvjYadYLDDW+WuR89sqdVYvYxlfy97ajuC1bsLU
         msyU/Hr8OTXgiJ/iiq9RTYjIDRAQ+kHTOJmP1zVX98vqw0piJvIbG+cite/qmvY5Nbp2
         hl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to
         :user-agent;
        bh=AmMJvvqepFQ5FHhs6fnEWr1vFGhqHnFVdKxKjcKH6a4=;
        b=MFp7KqXtgh+9oHjqtFs2oDPEicnJjg07UY5mHYcZzS7hpPm/DBphn0Ppy9E2faESRA
         lL/eLaYAG2BySuUDgccCJtsxnvFmzUJ1yCeFC86dvUcZOm4VxJ7B+Xvud4shRgE4K3pX
         4lahFviMUl6E9vWdZA1VDBQZufeNhWdUNrfp2wcsuXkuyBHaMKI5iH5T33mEmybiCRyk
         wpPkmT6yfNDSuZFCWxAQrzsmJUp6E/1wumENTUQGnfRk2JHL5eOT92rfw0hhd+p9a9vN
         AEXmp1UeAT05sPo1rynwsxZExc8x5HY17Ism7oq1hNeNDPMMCNl0VDF5umGRUqowjWr5
         ZM7w==
X-Gm-Message-State: APjAAAUzR0IUWktoEZV2TUT2gEzofpuvx4XmgxkpI4AFxaU2I9FDszeW
        TfnBn9+aqkkyBmcSDFKFo/lCSF4=
X-Google-Smtp-Source: APXvYqyYXI7eM4RiSHHR622mlEhE46EDMKMga5m5wSUJbkTPZI2Br29mAru7VL7oa25eQPjzYsdJDA==
X-Received: by 2002:aca:ef82:: with SMTP id n124mr4074950oih.177.1556837954144;
        Thu, 02 May 2019 15:59:14 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id m124sm280130oia.3.2019.05.02.15.59.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 15:59:13 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:d5e:aa5a:44d8:6907])
        by serve.minyard.net (Postfix) with ESMTPSA id 296321800D6;
        Thu,  2 May 2019 22:59:12 +0000 (UTC)
Date:   Thu, 2 May 2019 17:59:11 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     Asmaa Mnebhi <Asmaa@mellanox.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Michael Shych <michaelsh@mellanox.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v4 0/1] Add support for IPMB driver
Message-ID: <20190502225910.GK6623@minyard.net>
Reply-To: minyard@acm.org
References: <cover.1556645340.git.Asmaa@mellanox.com>
 <AM6PR05MB5224FCACBD4EF55F3890EC6AA23A0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <VI1PR05MB62392EDC0FD3C960519C91ABDA340@VI1PR05MB6239.eurprd05.prod.outlook.com>
 <20190502194954.GJ6623@minyard.net>
 <VI1PR05MB6239E3C9B9BBBA226DCFDD12DA340@VI1PR05MB6239.eurprd05.prod.outlook.com>
 <AM6PR05MB522465330E2C594B0309AE78A2340@AM6PR05MB5224.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR05MB522465330E2C594B0309AE78A2340@AM6PR05MB5224.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 02, 2019 at 09:14:46PM +0000, Vadim Pasternak wrote:
>  [...]
> > >
> > > >>Better, if you can avoid cast.
> > > >>Would compiler warn if you use for example rol16(client->addr, 1) &
> > GENMASK(7, 0); or something like it?
> > > I thought it wouldn't be too much of an issue to use typecast here since other
> > existing ipmi drivers use typecasting: bt-bmc.c, kcs_bmc_aspeed.c,
> > kcs_bmc_npcm7xx.c all use (u8) typecasting.
> > > But if you really think it is worth it, I could do that.
> > > I just think it is not as straight forward to read this code as using a simple
> > typecast. Some might wonder why a GENMASK is needed in this case.
> > >
> 
> Hi Asmaa,
> 
> I will not insist in case it's OK with maintainers.
> 
>  [...]

I'm mostly against casts unless they are necessary, as they tend
to clutter up the code.  But I don't feel that strongly about
it.  I'm not sure how other maintainers feel.

-corey
