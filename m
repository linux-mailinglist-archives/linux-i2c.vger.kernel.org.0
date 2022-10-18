Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6A9A6031B7
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Oct 2022 19:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbiJRRmA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Oct 2022 13:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiJRRl7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Oct 2022 13:41:59 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D6EDAC48;
        Tue, 18 Oct 2022 10:41:57 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 70D6E1FBB2;
        Tue, 18 Oct 2022 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1666114916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4p3VO3zt15ZuqFBtPT6ti1fzWjkAxD2YPTFZH5ianxU=;
        b=NTMgUwUE5P9CTuFhEZw/j93N/hNW0vN3Dtr582N1Cpf49gfk9vafRomh1vtFyIOU3HSsXZ
        cmE6U2bqC0J9fB4QR+SsLokhchSgkT2Z+89H/XCVcXCI3jLsf10JQTTQGGI7Y3V7hQm6x6
        bOviXckMlrn0twvcGqkWvgqrsv8yjH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1666114916;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4p3VO3zt15ZuqFBtPT6ti1fzWjkAxD2YPTFZH5ianxU=;
        b=63OfFXm7cO9Ufehc9lzbgLUgWYbAjCOtleUnS4JePEm5yL1+lNf/lKO84elSeHYWTRM6dr
        7CszzgkrOBFsS8Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E547139D2;
        Tue, 18 Oct 2022 17:41:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id KY2nDWTlTmP1HwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 18 Oct 2022 17:41:56 +0000
Date:   Tue, 18 Oct 2022 19:41:55 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jiangshan Yi <13667453960@163.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiangshan Yi <yijiangshan@kylinos.cn>,
        k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] i2c: sis630: fix spelling typo in comment
Message-ID: <20221018194155.5e04fd8f@endymion.delvare>
In-Reply-To: <20221009072802.2638945-1-13667453960@163.com>
References: <20221009072802.2638945-1-13667453960@163.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 09 Oct 2022 15:28:02 +0800, Jiangshan Yi wrote:
> From: Jiangshan Yi <yijiangshan@kylinos.cn>
> 
> Fix spelling typo in comment.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>  drivers/i2c/busses/i2c-sis630.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
> index cfb8e04a2a83..87d56250d78a 100644
> --- a/drivers/i2c/busses/i2c-sis630.c
> +++ b/drivers/i2c/busses/i2c-sis630.c
> @@ -97,7 +97,7 @@ MODULE_PARM_DESC(high_clock,
>  module_param(force, bool, 0);
>  MODULE_PARM_DESC(force, "Forcibly enable the SIS630. DANGEROUS!");
>  
> -/* SMBus base adress */
> +/* SMBus base address */
>  static unsigned short smbus_base;
>  
>  /* supported chips */

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
