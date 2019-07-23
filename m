Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28F35716E5
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2019 13:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730624AbfGWLXg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jul 2019 07:23:36 -0400
Received: from valentin-vidic.from.hr ([94.229.67.141]:58775 "EHLO
        valentin-vidic.from.hr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbfGWLXg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jul 2019 07:23:36 -0400
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
        id B39973A33C; Tue, 23 Jul 2019 13:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=valentin-vidic.from.hr; s=2017; t=1563881007;
        bh=2Mgnwoj5xR3QUy8vNL71/ooriKoYwrWLw0Pu7Exed/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YLv7LE+HDwA3PMd9cHtSpvNVWFMG8qsio8Axfcmobkvv54R4V/KNHXGN7u5lIQevo
         pu4J36s/5Y8HZ3QdcyzJy4RNnm+y4wNN6yIKZnRPs9yzHl6b4lRJEGhphIAYnUvxu3
         I+qmd7Ae+BBv2iMJjhJ4J0Mgpo9xSdyVS8tLOCCUvdB87ug7YEVxa/G3JvjUMLmh58
         76mKhQD4h+eM2cVK1Z97jTWF/y2GjZZ2ccVNRY44r5pTZEsB5AxuRGWdfQcYhDlG8J
         ga8otXLtOZj0COfbxGGBFqBsI5qOj+azZdVurRffCtuzN8LWlTPgl/hAhBSg167jEs
         t59qAH2vKJijA==
Date:   Tue, 23 Jul 2019 13:23:27 +0200
From:   Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: iTCO_wdt on Intel NUC
Message-ID: <20190723112327.dvvnjwpxqx5mlc6f@valentin-vidic.from.hr>
References: <20190722174504.qwp52opvy6ptyxn6@valentin-vidic.from.hr>
 <20190723100256.3895bd3b@endymion>
 <20190723085546.n4c33twqrtul6fae@valentin-vidic.from.hr>
 <20190723120936.176290d2@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723120936.176290d2@endymion>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 23, 2019 at 12:09:36PM +0200, Jean Delvare wrote:
> As a conclusion, your problem is that your watchdog device was not
> properly configured by the BIOS. The device needs to be assigned an I/O
> memory range within a Reserved area, NOT System RAM. A range that's
> also not used by any other device. The BIOS author is supposed to make
> the decision.
> 
> So... I think you're up for a visit to your BIOS options in case
> anything related to the watchdog can be configured. If that doesn't
> help, look for BIOS updates for your system. And if that still doesn't
> help, you'll have to complain to your system vendor.

Thank you for the detailed explanation. I suspected it could be
something to do with this platform as I don't get errors loading
iTCO_wdt on other Intel based systems. I already checked BIOS menus
and did not find anything mentioning watchdog but I will try once
more. Also maybe it has to do with UEFI so Legacy boot might help?

In case that does not work out maybe Felipe could help?  Or there
is someone else at Intel I could contact as this seems to be a
more general problem (I found complaints of watchdog not working
on older NUC generations too)?

-- 
Valentin
