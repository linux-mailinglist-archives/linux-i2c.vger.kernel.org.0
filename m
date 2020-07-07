Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06FC216DCE
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jul 2020 15:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbgGGNfe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jul 2020 09:35:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:58938 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727090AbgGGNfe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jul 2020 09:35:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 79C32AC23;
        Tue,  7 Jul 2020 13:35:33 +0000 (UTC)
Date:   Tue, 7 Jul 2020 15:35:32 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH 2/2] i2c: i801: Add support for Intel Tiger Lake PCH-H
Message-ID: <20200707153532.6aabbbf4@endymion>
In-Reply-To: <20200618134240.4091271-2-jarkko.nikula@linux.intel.com>
References: <20200618134240.4091271-1-jarkko.nikula@linux.intel.com>
        <20200618134240.4091271-2-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 18 Jun 2020 16:42:40 +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Tiger Lake PCH-H.

s/ on / of / ?

> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 4 ++++
>  1 file changed, 4 insertions(+)
> (...)

Other than this (which Wolfram can probably fix on the fly):

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
