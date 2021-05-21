Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A3938C595
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 13:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232966AbhEULXY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 07:23:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:33452 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhEULXX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 07:23:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7CBC9AC11;
        Fri, 21 May 2021 11:21:59 +0000 (UTC)
Date:   Fri, 21 May 2021 13:21:58 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for
 returned length from driver"
Message-ID: <20210521132158.6e0689c0@endymion>
In-Reply-To: <20210413125433.GA9879@kunai>
References: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
        <20210226174337.63a9c2a6@endymion>
        <20210310204648.GA332643@ninjato>
        <87tuoe5zfc.fsf@dell.be.48ers.dk>
        <20210413125433.GA9879@kunai>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, 13 Apr 2021 14:54:33 +0200, Wolfram Sang wrote:
> >  > I added a section now for the 4.2 release. And (finally!) started
> >  > cleaning up the wiki a little.  
> > 
> > Thanks! As a packager, I must say that this way of handling bugfixes
> > isn't great - I only just noticed this now by accident.
> > 
> > What is the issue with making bugfix releases?  
> 
> Instead of a minor 4.2.1 we could maybe also simply do a 4.3?

Sounds reasonable, saves the need to change the process. Sure it feels
strange to make a new release with only 2 commits since the previous
release, OTOH we have a regression in one of the tools, which is
something rare (thankfully) and problematic enough to justify a rush of
schedule.

I'll take care of that ASAP if that's OK with you. If you have any
other change that should make it into 4.3, now is the time to commit it.

-- 
Jean Delvare
SUSE L3 Support
