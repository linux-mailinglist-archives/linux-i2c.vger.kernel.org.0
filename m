Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF4864BC21
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2019 16:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbfFSO50 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jun 2019 10:57:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:55708 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725899AbfFSO50 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jun 2019 10:57:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 90079AF47;
        Wed, 19 Jun 2019 14:57:25 +0000 (UTC)
Date:   Wed, 19 Jun 2019 16:57:24 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2] i2c: i801: Add Block Write-Block Read Process Call
 support
Message-ID: <20190619165724.2eece890@endymion>
In-Reply-To: <20190618170633.14774-1-alexander.sverdlin@nokia.com>
References: <20190617161951.56510723@endymion>
        <20190618170633.14774-1-alexander.sverdlin@nokia.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 18 Jun 2019 17:06:50 +0000, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Add SMBUS 2.0 Block Write-Block Read Process Call command support.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
> Changelog:
> v2: Updated Documentation
> 
>  Documentation/i2c/busses/i2c-i801 |  2 +-
>  drivers/i2c/busses/i2c-i801.c     | 43 +++++++++++++++++++++++++++++++++------
>  2 files changed, 38 insertions(+), 7 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks for your contribution!

-- 
Jean Delvare
SUSE L3 Support
