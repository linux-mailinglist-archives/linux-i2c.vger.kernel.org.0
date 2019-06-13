Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C25C43E84
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731686AbfFMPus (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:50:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:55384 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731679AbfFMJNM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jun 2019 05:13:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C5B09AEC6;
        Thu, 13 Jun 2019 09:13:11 +0000 (UTC)
Date:   Thu, 13 Jun 2019 11:13:10 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Add Block Write-Block Read Process Call
 support
Message-ID: <20190613111310.3be13499@endymion>
In-Reply-To: <20180829161810.2147-1-alexander.sverdlin@nokia.com>
References: <20180829161810.2147-1-alexander.sverdlin@nokia.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alexander,

Sorry for the very late reply.

On Wed, 29 Aug 2018 18:18:10 +0200, Alexander Sverdlin wrote:
> Add SMBUS 2.0 Block Write-Block Read Process Call command support.

I have never seen any SMBus device using this command. Which device do
you need it for?

> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 43 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 37 insertions(+), 6 deletions(-)
> (...)

Looks good overall, except for missing an update to the documentation
file (Documentation/i2c/busses/i2c-i801). However I will only consider
applying the patch if it has a real use case.

-- 
Jean Delvare
SUSE L3 Support
