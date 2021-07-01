Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7580A3B9184
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jul 2021 14:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236328AbhGAMQv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jul 2021 08:16:51 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45456 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236192AbhGAMQv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jul 2021 08:16:51 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2E848228B7;
        Thu,  1 Jul 2021 12:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1625141660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E+tIfXy1UmBt8fIIfmz11YsGUbPEBLU0kzYNxmJPsB4=;
        b=f6UwE7/RD6Pi5rZnVt0Pjw5k6MH9MsvQnFNQ8RnrSxvRlDiAy4mwrv2FXmmUkuW8OumJnZ
        AVW1GW+JLce5E/RQM9bqdWH8sM35CPZVcEnL5zJPVw3OrCC7/8idkDUjiPlJz3iCg2TlQ0
        6JmFAJtS2uxjJcvWtT+n5dYIVdsawiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1625141660;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E+tIfXy1UmBt8fIIfmz11YsGUbPEBLU0kzYNxmJPsB4=;
        b=SqxFyzxxJwaayYexi2jgcsN7Kl9hkw6DBKxFg2AEuE23HZOWlCJxuFcIPU6ILzsf32Z3uJ
        +ALDEX3jsJd9BBBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id E952811CC0;
        Thu,  1 Jul 2021 12:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1625141660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E+tIfXy1UmBt8fIIfmz11YsGUbPEBLU0kzYNxmJPsB4=;
        b=f6UwE7/RD6Pi5rZnVt0Pjw5k6MH9MsvQnFNQ8RnrSxvRlDiAy4mwrv2FXmmUkuW8OumJnZ
        AVW1GW+JLce5E/RQM9bqdWH8sM35CPZVcEnL5zJPVw3OrCC7/8idkDUjiPlJz3iCg2TlQ0
        6JmFAJtS2uxjJcvWtT+n5dYIVdsawiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1625141660;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E+tIfXy1UmBt8fIIfmz11YsGUbPEBLU0kzYNxmJPsB4=;
        b=SqxFyzxxJwaayYexi2jgcsN7Kl9hkw6DBKxFg2AEuE23HZOWlCJxuFcIPU6ILzsf32Z3uJ
        +ALDEX3jsJd9BBBQ==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id eoL1NZux3WCdGgAALh3uQQ
        (envelope-from <jdelvare@suse.de>); Thu, 01 Jul 2021 12:14:19 +0000
Date:   Thu, 1 Jul 2021 14:14:18 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ali1535: mention that the device should not be
 disabled
Message-ID: <20210701141418.0b51d668@endymion>
In-Reply-To: <20210625151758.12180-1-wsa@kernel.org>
References: <20210625151758.12180-1-wsa@kernel.org>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 25 Jun 2021 17:17:58 +0200, Wolfram Sang wrote:
> The comment from the i801 driver is valid here, too, so copy it.
> 
> Reported-by: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
>  drivers/i2c/busses/i2c-ali1535.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
> index fb93152845f4..ee83c4581bce 100644
> --- a/drivers/i2c/busses/i2c-ali1535.c
> +++ b/drivers/i2c/busses/i2c-ali1535.c
> @@ -508,6 +508,11 @@ static void ali1535_remove(struct pci_dev *dev)
>  {
>  	i2c_del_adapter(&ali1535_adapter);
>  	release_region(ali1535_smba, ALI1535_SMB_IOSIZE);
> +
> +	/*
> +	 * do not call pci_disable_device(dev) since it can cause hard hangs on
> +	 * some systems during power-off
> +	 */
>  }
>  
>  static struct pci_driver ali1535_driver = {

Can't hurt.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
