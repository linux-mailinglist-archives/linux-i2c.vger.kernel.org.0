Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C07EC71F5D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2019 20:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbfGWSez (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jul 2019 14:34:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:54308 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727021AbfGWSez (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jul 2019 14:34:55 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 12F98AC93;
        Tue, 23 Jul 2019 18:34:54 +0000 (UTC)
Date:   Tue, 23 Jul 2019 20:34:52 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Chuhong Yuan" <hslester96@gmail.com>
Cc:     "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: busses: Use dev_get_drvdata where possible
Message-ID: <20190723203452.5714f142@endymion>
In-Reply-To: <20190723111110.11121-1-hslester96@gmail.com>
References: <20190723111110.11121-1-hslester96@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 23 Jul 2019 19:11:10 +0800, Chuhong Yuan wrote:
> Instead of using to_pci_dev + pci_get_drvdata,
> use dev_get_drvdata to make code simpler.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/i2c/busses/i2c-designware-pcidrv.c | 6 ++----
>  drivers/i2c/busses/i2c-i801.c              | 3 +--
>  2 files changed, 3 insertions(+), 6 deletions(-)
> (...)

Looks good to me, thanks.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
