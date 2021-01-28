Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9BB3076E5
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 14:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbhA1NQY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 08:16:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231882AbhA1NQX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Jan 2021 08:16:23 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E41DC061574
        for <linux-i2c@vger.kernel.org>; Thu, 28 Jan 2021 05:15:43 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id x71so5915573oia.9
        for <linux-i2c@vger.kernel.org>; Thu, 28 Jan 2021 05:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=MYMnyq9aiAmBgXk76odK/uDrbX7yILPvUUSs8LZrwNw=;
        b=IrqLAPLLRuH0l4zw49WppVMRW/uuhP+xUXxPF5F03JoXE2uuZIb7JjcGukwqFJSOoB
         QqWi7pzjDoTKGgr8tvvC4aFJRRnNkmU4bNtm2Hm69x74jOKWbX53nJ2WtkXkWh3DWyN+
         3kNpYa3krMenE9ZmZSni+cwGd+QLZYxeX9kMZB7AlhN+yYdw7/wQZpvjn6BR8zRCoSP2
         TAyqZz7snRci/1ibTTtOPPHqYMHEKcj00+4JAjyCnr95XXh6iGemuOQheMmthiBji68l
         RiTmDSgSbNh+6jr2wCZh5GxRGeit5wWjPnns+8FJO3meZ5wmfRMu3eRX0YgX8PWahwZm
         p/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=MYMnyq9aiAmBgXk76odK/uDrbX7yILPvUUSs8LZrwNw=;
        b=iNWVoTJRK8Lg9yLbohkXCBLv3PvAEhiTGME0ciR+7T7P8sr52soUuoa+aOWJO+/qJI
         pzvC8ZpZWOeBTGsWN8Ny9obseqiHjDb1UFcVgeA4nx603cDGoiwRiU4clnJ5/yLpkIoH
         u+pmU2f2d0V5mhopITQoTJ+yWX6Zalf5nYe0NClyLuGtOb8NU1Vnww6lMvzmwogvxOMK
         Ug/215yQtv9KyR5f4+GBJ5NA2787726S8pt27L1YLHsuYoYVxTiiX1WqB2/0NM2yyQAm
         /tgFJfDIRoIK6xp/EN3qW8xX+MgipAN0SqkpmbinB0jcuvFdjpumGu6Ojwruzgn9dMds
         sObQ==
X-Gm-Message-State: AOAM530hMctkKhETHcssSZYNd8K4Hry4hcHdZb/WBZHi7o/rBh6sahK0
        gUYld2c6xmUHo6FW5trTSbLq8A==
X-Google-Smtp-Source: ABdhPJxX+uVsYKsI7NArfnD5+TrBoPQkjiuV59z9z5sB/J1DULJ3nl/+98FxbrC939C6MWUm6vJ2LQ==
X-Received: by 2002:aca:57c8:: with SMTP id l191mr6478760oib.23.1611839742940;
        Thu, 28 Jan 2021 05:15:42 -0800 (PST)
Received: from minyard.net ([2001:470:b8f6:1b:d0e0:7e1d:debb:57fe])
        by smtp.gmail.com with ESMTPSA id h18sm983785otk.26.2021.01.28.05.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 05:15:42 -0800 (PST)
Date:   Thu, 28 Jan 2021 07:15:40 -0600
From:   Corey Minyard <cminyard@mvista.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Asmaa Mnebhi <asmaa@nvidia.com>,
        Corey Minyard <minyard@acm.org>,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ipmi: remove open coded version of SMBus block
 write
Message-ID: <20210128131540.GY21462@minyard.net>
Reply-To: cminyard@mvista.com
References: <20210128085544.7609-1-wsa+renesas@sang-engineering.com>
 <20210128123757.GW21462@minyard.net>
 <20210128125350.GP963@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128125350.GP963@ninjato>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 28, 2021 at 01:53:50PM +0100, Wolfram Sang wrote:
> On Thu, Jan 28, 2021 at 06:37:57AM -0600, Corey Minyard wrote:
> > Looks good, do you want this in the IPMI tree or are you handling this
> > another way?
> 
> I can take it but would prefer the IPMI tree.

Ok, it's queued for next merge window.

-corey

> 
> Thanks!
> 


