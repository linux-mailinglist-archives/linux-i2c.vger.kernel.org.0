Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9EE151F1C
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2020 18:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgBDRRp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Feb 2020 12:17:45 -0500
Received: from mx2.suse.de ([195.135.220.15]:55744 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727310AbgBDRRp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Feb 2020 12:17:45 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 36234AFB5;
        Tue,  4 Feb 2020 17:17:43 +0000 (UTC)
Date:   Tue, 4 Feb 2020 18:17:40 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Lei YU <mine260309@gmail.com>
Subject: Re: [PATCH 2/2] docs: i2c: dev-interface: document the actual
 implementation
Message-ID: <20200204181740.5d8f6645@endymion>
In-Reply-To: <11fd5351-e273-c700-2e6b-2066a5e77798@lucaceresoli.net>
References: <20200123105246.67732e33@endymion>
        <20200123111137.5899fa5a@endymion>
        <20200123110909.GG1105@ninjato>
        <ffac66db-0b58-b832-f6b5-d1a1da7a1da9@lucaceresoli.net>
        <20200203142701.5c1db1ba@endymion>
        <11fd5351-e273-c700-2e6b-2066a5e77798@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Luca,

On Mon, 3 Feb 2020 17:35:15 +0100, Luca Ceresoli wrote:
> On 03/02/20 14:27, Jean Delvare wrote:
> > Hmmm. It's not like you can do everything with libi2c so you should
> > always use it. There are several things that can't be done with libi2c
> > so you will have to do them "manually". Anything that doesn't fit in the
> > SMBus specification basically. As a matter of fact, i2ctransfer does
> > not use libi2c.
> > 
> > Also, even when using libi2c, you still need to explicitly open the
> > device node, set the slave address, and close the device when you are
> > done (just seeing that's missing from the C example but it should be
> > added). So the C example is still relevant even if you use libi2c.
> > 
> > So I'm not sure swapping the sections makes that much sense. What would
> > help on the other hand is to add a pointer to the C library section at
> > the point of the C example where using the library would simplify the
> > code. Would that work for you?  
> 
> In my opinion we should first document the recommended way. Assuming
> libi2c is the recommended way for all uses it is capable of, that means
> documenting libi2c first.
> 
> Additionally, before documenting any of them I'd add a preamble similar
> to: "The I2C device can be accessed from user space either using the
> libi2c library or using low-level C functions directly. libi2c is more
> high-level but has limited functionality.". This is so it's clear to the
> reader from the beginning that there are two alternative approaches,
> whose explanation will follow.

Thank you for the suggested improvements, I agree they will make the
documentation easier to read. I'll integrate these changes in v2.

It might also make sense to add an example of the C library usage in
libi2c(3).

-- 
Jean Delvare
SUSE L3 Support
