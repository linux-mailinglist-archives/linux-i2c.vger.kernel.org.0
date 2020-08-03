Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6277C23A8EE
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 16:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbgHCOxZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 10:53:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:41834 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbgHCOxZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Aug 2020 10:53:25 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 0D2AAB626;
        Mon,  3 Aug 2020 14:53:38 +0000 (UTC)
Date:   Mon, 3 Aug 2020 16:53:21 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: VAIO EEPROM support in at24
Message-ID: <20200803165321.4334af05@endymion>
In-Reply-To: <20200317150142.GA1134@ninjato>
References: <20200317151409.7940926c@endymion>
        <CAMRc=Mdoh5Sk3iS_CO4+++SG2jJOy1qrG4q2zOzbeYYMdJR0VA@mail.gmail.com>
        <20200317150142.GA1134@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Sorry, somehow this message of yours slipped through the cracks.

On Tue, 17 Mar 2020 16:01:42 +0100, Wolfram Sang wrote:
> > And we could introduce a new macro called AT24_CHIP_DATA_MASKED that
> > would automacially set the AT24_FLAG_MASKED_RANGE flag and take
> > another argument that would contain the address and size of the masked
> > register range (we'd put it into the "masked" resource)?  
> 
> I am all for generic solutions. One thing to consider here is that we
> need a generic way to detect the various types. I guess it will
> always(?) be decided on some memory locations having specific values?

In the case of Sony VAIO EEPROMs, they can be identified by the
combination of the EEPROM's I2C address (always 0x57) and the value of
the 4 bytes at register address 0x80 (would read either "PCG-" or
"VGN-"). If that's not considered robust enough then I suppose we could
improve it further by checking that the DMI vendor is "Sony
Corporation".

That being said, automatic detection was not even on my mind
originally. If we had a specific type defined for these EEPROMs, as we
do with SPD EEPROMs, then one could easily instantiate them from
user-space using the "new_device" sysfs attribute at the I2C bus level.
This is exactly how we have been doing it for SPD EEPROMs until
recently, as you have just merged my patch set to automate this
recently. And even then, it's still limited to x86 and specific systems
at the moment.

Incidentally, instantiating these Sony VAIO EEPROMs automatically would
share some code with that patch set, so that might be a good sign that
it's the right time to look into that.

I may give a try to Bartosz's idea to make it somewhat generic if
everybody agrees that's the way to go. I'm not deeply familiar with the
at24 driver so I'm not sure how to do it, but hopefully it will get
clearer as I progress.

-- 
Jean Delvare
SUSE L3 Support
