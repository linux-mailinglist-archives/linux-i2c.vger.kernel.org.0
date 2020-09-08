Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5122621B5
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 23:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbgIHVIc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 17:08:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:37112 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728390AbgIHVIb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Sep 2020 17:08:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 812D0ADC5;
        Tue,  8 Sep 2020 21:08:29 +0000 (UTC)
Date:   Tue, 8 Sep 2020 23:08:27 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        David Jedynak <sileasresearch@gmail.com>
Subject: Re: [PATCH] i2cset: Fix short writes with mask
Message-ID: <20200908230827.6c3ecd2f@endymion>
In-Reply-To: <20200908154029.GA1772@ninjato>
References: <20200903110054.52a3a69f@endymion>
        <20200908065111.GA5936@ninjato>
        <20200908171908.65690731@endymion>
        <20200908154029.GA1772@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 8 Sep 2020 17:40:29 +0200, Wolfram Sang wrote:
> Hi Jean,
> 
> > Funny story, while I only posted this last week, I wrote the fix
> > several months ago, so last week I actually got to review my own code
> > with fresh eyes, and when I stumbled upon that specific change, first
> > thing that came to my mind was "this is a useless change, why did I do
> > that ?" Then I scrolled up, checked the other changes in that function,
> > noticed the removed "else" and said OK, I'm not that stupid after all
> > ;-)  
> 
> :) Now that there are two of us, maybe this justifies a short comment
> explaining it?

Well, the code itself isn't tricky, and it's only more of the same,
nothing new. The surprise was only for the patch reviewers, and now
this is cleared, and I committed the patch already. So I don't think
there's anything left to do.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
