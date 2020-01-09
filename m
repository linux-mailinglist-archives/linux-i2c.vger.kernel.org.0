Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF050135E7C
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 17:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgAIQjc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 11:39:32 -0500
Received: from mx2.suse.de ([195.135.220.15]:34116 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730477AbgAIQjc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 11:39:32 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id BCFD9AD73;
        Thu,  9 Jan 2020 16:39:30 +0000 (UTC)
Date:   Thu, 9 Jan 2020 17:39:29 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Lei YU <mine260309@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: i2c: Fix return value of i2c_smbus_xxx
 functions
Message-ID: <20200109173929.1b42e0a6@endymion>
In-Reply-To: <20200106130056.GA1290@ninjato>
References: <1574162632-65848-1-git-send-email-mine260309@gmail.com>
        <20191125144857.GA2412@kunai>
        <20191126115243.673fc164@endymion>
        <20200106130056.GA1290@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 6 Jan 2020 14:01:09 +0100, Wolfram Sang wrote:
> > I would go further and move half of the document to i2c-tools. i2c-dev
> > itself only provides the ioctls. Everything on top of that is in libi2c
> > now, so the kernel documentation should point to libi2c and the
> > detailed documentation should come with libi2c.
> > 
> > So I guess I should review the whole document now to see what needs to
> > be updated, what should stay, and what should move.  
> 
> Maybe you can collaborate with Luca on this who just revamped a lot of
> the docs? Putting him on CC and marking this patch as 'Deferred'.

I'm resuming my work on this. Luca, can you point me to your changes to
Documentation/i2c/dev-interface.rst so that I can adjust my own changes
to fit on top?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
