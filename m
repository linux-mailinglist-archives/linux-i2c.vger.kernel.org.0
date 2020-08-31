Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5B12579FE
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 15:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgHaNER (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 09:04:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:34942 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727822AbgHaNEN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Aug 2020 09:04:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8F8E4B64A;
        Mon, 31 Aug 2020 13:04:06 +0000 (UTC)
Date:   Mon, 31 Aug 2020 15:04:05 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] decode-vaio: Scan more i2c buses
Message-ID: <20200831150405.1a2df039@endymion>
In-Reply-To: <20200831094855.GA1070@ninjato>
References: <20200831100256.077ce253@endymion>
        <20200831100919.519f66a6@endymion>
        <20200831094855.GA1070@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 31 Aug 2020 11:48:55 +0200, Wolfram Sang wrote:
> > -for (my $i = 0, $found=0; $i <= 4 && !$found; $i++)
> > +for (my $i = 0, $found=0; $i <= 31 && !$found; $i++)  
> 
> To get rid of the problem entirely, can't we do something like this
> with shell globs? Pseudo code:
> 
> 	foreach (/sys/bus/i2c/devices/*-0057/eeprom)
> 		$found += <found device>
> 
> 	if (!$found)
> 		foreach (/proc/sys/dev/sensors/eeprom-i2c-*-57)
> 		check_old_interface
> 		$found += <found device>

You have hit my perl knowledge limits ;-)

I know that arbitrary limits are bad, but the thing is, I'm not sure if
there is any actual user left for that script. I adjusted it for the
at24 driver because *if* there are users left then things should keep
working. But I wrote all this in 2001, laptops from then are definitely
no longer in use, and at this point I have no idea if recent VAIO
laptops still have this EEPROM.

So until someone comes to me with a recent VAIO laptop that needs this,
I am reluctant to invest more time into this.

-- 
Jean Delvare
SUSE L3 Support
