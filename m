Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02FA76F5AD8
	for <lists+linux-i2c@lfdr.de>; Wed,  3 May 2023 17:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbjECPUk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 May 2023 11:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjECPUc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 May 2023 11:20:32 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0BD7294
        for <linux-i2c@vger.kernel.org>; Wed,  3 May 2023 08:20:22 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id ED7B22296B;
        Wed,  3 May 2023 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683127220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CXl718XxWw1VSMkUoyyzNRt5gtWgPlSkj3wvowwBbck=;
        b=AkwWEL9XxazAQb85q8pqi/mKIQSPbi8AT3iUnUGYVQWRVtCYC/IrPx85ObDH1f3xX/iVWR
        CI6UrLgv5GOfXuMuTuKPKS9M78xhS77x4hBpsgdgZkC2u828ChGvwnr6Z87I8BVh4/KqLG
        x6TnIGQaa9B4ZT63z8S6auqWh2Nfgqw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683127220;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CXl718XxWw1VSMkUoyyzNRt5gtWgPlSkj3wvowwBbck=;
        b=qjhfyVEgDOMWpo7UmQIOv3sn4eCMAVF2uZIe4HA3R+HJ2FM9XqT2dJHa6oMzr1FZa1BSII
        RaIXpvRUUiYYA+Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C66EE13584;
        Wed,  3 May 2023 15:20:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 66uaLrR7UmQHYgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 03 May 2023 15:20:20 +0000
Date:   Wed, 3 May 2023 17:20:19 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2 2/2] i2c: i801: Add support for Intel Meteor Lake
 PCH-S
Message-ID: <20230503172019.4c861e1a@endymion.delvare>
In-Reply-To: <20230424105757.732150-2-jarkko.nikula@linux.intel.com>
References: <20230424105757.732150-1-jarkko.nikula@linux.intel.com>
        <20230424105757.732150-2-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarkko,

On Mon, 24 Apr 2023 13:57:57 +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Meteor Lake PCH-S. Also called as Meteor
> Point-S which is used in the code to distinguish from Meteor Lake-S SoC
> but call both as Meteor Lake in documentation and Kconfig.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> Hi Jean. This is essentially the same than v1 with following minor
> changes:
> v2: "SOC/PCH" -> "SOC and PCH" in documentation and Kconfig. PCI ID
>     define according to updated patch 1/2.

My initial concerns partly stand. You add a device named
"Meteor Point-S" to the driver, but you list that device under name
"Meteor Lake-S" in the documentation (and Kconfig). This is confusing
and I can't see the rationale. Surely the device has one name, and you
should use that name both in the driver and the documentation.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
