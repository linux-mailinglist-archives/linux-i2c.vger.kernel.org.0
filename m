Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73122565F5
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Aug 2020 10:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgH2ISj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Aug 2020 04:18:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:38398 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbgH2ISi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Aug 2020 04:18:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 23AE5AC26;
        Sat, 29 Aug 2020 08:19:10 +0000 (UTC)
Date:   Sat, 29 Aug 2020 10:18:35 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 2/2] decode-vaio: Add support for the at24 driver
Message-ID: <20200829101835.3aeb4d6a@endymion>
In-Reply-To: <20200828084703.GG1343@ninjato>
References: <20200827152523.6cc67392@endymion>
        <20200827152842.44105002@endymion>
        <20200828084703.GG1343@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 28 Aug 2020 10:47:03 +0200, Wolfram Sang wrote:
> > -for (my $i = 0, $found=0; $i <= 4 && !$found; $i++)
> > +for (my $i = 0, $found=0; $i <= 31 && !$found; $i++)  
> 
> Isn't this an unrelated change, scanning more busses? Should be at least
> mentioned in the commit message, if so.

You're right, it should be a separate commit. I had to do this to be
able to test my changes with i2c-stub instead of using the actual old
Sony laptop. Then I forgot the change was there. I'll push that change
anyway as it can't hurt and everything that makes testing easier is
welcome.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
