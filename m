Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 424E538C583
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 13:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234422AbhEULR1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 07:17:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:59200 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232470AbhEULR0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 07:17:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C73D0AAFD;
        Fri, 21 May 2021 11:16:01 +0000 (UTC)
Date:   Fri, 21 May 2021 13:16:00 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Peter Korsgaard <peter@korsgaard.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for
 returned length from driver"
Message-ID: <20210521131600.416c5ca7@endymion>
In-Reply-To: <87tuoe5zfc.fsf@dell.be.48ers.dk>
References: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
        <20210226174337.63a9c2a6@endymion>
        <20210310204648.GA332643@ninjato>
        <87tuoe5zfc.fsf@dell.be.48ers.dk>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,

On Sat, 10 Apr 2021 10:14:31 +0200, Peter Korsgaard wrote:
> >>>>> "Wolfram" == Wolfram Sang <wsa+renesas@sang-engineering.com> writes:  
> 
>  >> We don't usually do minor version updates for bug fixes. Instead, what
>  >> I do is maintain a list of such "must have" fixes, that package
>  >> maintainers can refer to. Look for "Recommended patches" at:
>  >> 
>  >> https://i2c.wiki.kernel.org/index.php/I2C_Tools
>  >> 
>  >> There's no section for version 4.2 yet, but we can add one as soon as
>  >> the commit hits the public repository.  
> 
>  > I added a section now for the 4.2 release. And (finally!) started
>  > cleaning up the wiki a little.  
> 
> Thanks! As a packager, I must say that this way of handling bugfixes
> isn't great - I only just noticed this now by accident.
> 
> What is the issue with making bugfix releases?

The main issue is that making releases (bugfix or not) takes time. Even
though it's partly automated, there are still a number of manual steps
involved, and you can't afford getting them wrong. So as far as I am
concerned, making a release is always a time of stress.

Making a bugfix release would also require a change in my process, as
we would need a new branch in git to cherry pick the fixes that need to
go into the bugfix release.

Second issue is that I chose to go for 2-number versions for i2c tools
v4. Doing bugfix releases with 3 numbers now means mixing 2-number
versions with 3-number versions which can lead to confusion (for
sorting order, if nothing else). Maybe I should have gone for 3-number
versions, but as I did not have the intention to make bugfix releases
in the first place, this seemed overkill. And I still think it is, as I
believe - if memory serves - it is the first time we face a regression
in i2c-tools since I started managing the project. i2c-tools is a small
project with few commits, I simply don't want to make the process
around it more complex than needed.

I must say I'm surprised to see requests for more frequent and/or
bugfix releases when the world has moved to CD/CI and some projects
have abandoned the very notion of version number. If you can't be
bothered with checking the recommended fixes on top of the latest
release, then maybe just use the latest git snapshot always?

-- 
Jean Delvare
SUSE L3 Support
