Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1D3216DC3
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jul 2020 15:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgGGNd1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jul 2020 09:33:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:57788 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbgGGNd1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jul 2020 09:33:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 4D5C1AC43;
        Tue,  7 Jul 2020 13:33:26 +0000 (UTC)
Date:   Tue, 7 Jul 2020 15:33:24 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/2] i2c: i801: Add support for Intel Emmitsburg PCH
Message-ID: <20200707153324.361be5e3@endymion>
In-Reply-To: <20200618134240.4091271-1-jarkko.nikula@linux.intel.com>
References: <20200618134240.4091271-1-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 18 Jun 2020 16:42:39 +0300, Jarkko Nikula wrote:
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Add support for SMBus controller on Intel Emmitsburg PCH. This is the
> same IP as used in Cannon Lake and derivatives.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  Documentation/i2c/busses/i2c-i801.rst | 1 +
>  drivers/i2c/busses/Kconfig            | 1 +
>  drivers/i2c/busses/i2c-i801.c         | 4 ++++
>  3 files changed, 6 insertions(+)
> (...)

Signed-off-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
