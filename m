Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B79D923EA73
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 11:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgHGJgc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 05:36:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:36350 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726382AbgHGJgc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Aug 2020 05:36:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F1D22AF77;
        Fri,  7 Aug 2020 09:36:48 +0000 (UTC)
Date:   Fri, 7 Aug 2020 11:36:30 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] add BUGS section to manpages
Message-ID: <20200807113630.045b0208@endymion>
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

On Thu,  6 Aug 2020 16:54:21 +0200, Wolfram Sang wrote:
> For all manpages installed on my Debian system, add a BUGS section, so
> people can easily find whom to contact.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  eeprom/decode-dimms.1     | 3 +++
>  eeprom/decode-vaio.1      | 3 +++
>  stub/i2c-stub-from-dump.8 | 4 ++++
>  tools/i2cdetect.8         | 4 ++++
>  tools/i2cdump.8           | 4 ++++
>  tools/i2cget.8            | 4 ++++
>  tools/i2cset.8            | 4 ++++
>  tools/i2ctransfer.8       | 4 ++++
>  8 files changed, 30 insertions(+)
> (...)

Sure, can't hurt.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
