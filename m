Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6024A25C340
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 16:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbgICOr6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 10:47:58 -0400
Received: from mx2.suse.de ([195.135.220.15]:38064 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729207AbgICOXu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Sep 2020 10:23:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5CE64AD33;
        Thu,  3 Sep 2020 13:34:25 +0000 (UTC)
Date:   Thu, 3 Sep 2020 15:34:23 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] add BUGS section to manpages
Message-ID: <20200903153423.0cf6d9c6@endymion>
In-Reply-To: <20200806145421.1389-1-wsa+renesas@sang-engineering.com>
References: <20200806145421.1389-1-wsa+renesas@sang-engineering.com>
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

On Thu,  6 Aug 2020 16:54:21 +0200, Wolfram Sang wrote:
> For all manpages installed on my Debian system, add a BUGS section, so
> people can easily find whom to contact.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> (...)
> --- a/eeprom/decode-dimms.1
> +++ b/eeprom/decode-dimms.1
> @@ -62,6 +62,9 @@ Same as -x except treat multibyte hex data as little endian
>  .TP
>  .B \-h, --help
>  Display the usage summary
> +.SH BUGS
> +To report bugs or send fixes, please write to the Linux I2C mailing list
> +<linux-i2c@vger.kernel.org>.
>  .SH SEE ALSO
>  .BR decode-vaio (1)
>  .SH AUTHORS

On second thought... I see an issue with this.

So far, the contact information for reporting bugs was in the README
file:

Please post your questions and bug reports to the linux-i2c mailing list:
  linux-i2c@vger.kernel.org
with Cc to the current maintainer:
  Jean Delvare <jdelvare@suse.de>

Now the manual pages point to the mailing list only, which I am not
reading. It seems kind of wrong to tell users to report bugs on a list
which the current maintainer isn't reading.

I can see 3 solutions to that:

1a* I subscribe to linux-i2c again. I'm afraid this won't go well
though, as I unsubscribed for a reason - I no longer had time to read
that list and most of the traffic had no interest for me. These reasons
did not change. So even if I do subscribe, chances are that I won't
read the list and thus miss the relevant reports.

1b* Same as 1a but we explicitly ask people to add "i2c-tools" to the
subject, so that I can filter out everything else. That's not bullet
proof, and causes useless traffic to my mail box, but could work.

2* Add my address to the BUGS section of the manual pages, together
with the list's address. That should work for the time being, but I
don't feel too comfortable with my name being put forward that way,
plus this will require updating all files whenever the maintainer
changes (don't panic, I have no plan to leave, but no one can tell what
the future holds).

3* Create a separate list for linux-i2c tools. I think the VGER admins
are more open to creating additional lists than they were 13 years ago
when i2c-tools saw existence as a separate project. I would - obviously
- subscribe to that list. The advantage is that we then have a clear
separation between kernel-space topics and user-space topics, and
everyone can subscribe to either or both lists depending on their
needs, which is more flexible. The drawback is that people who are
interested in everything have twice as much work to subscribe, manage
their subscription and unsubscribe. Another issue is that it will take
some time before the information propagates and users start using the
new list for i2c-tools questions and bug reports.

And of course there's always the status quo option:

4* Do nothing. You get to let me know whenever something hits the list
that I should look into. That's fine with me, but this adds another
single point of failure on the path, and means extra work for you too.

What do you think?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
