Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4404C554372
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jun 2022 09:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbiFVGji (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jun 2022 02:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234254AbiFVGjd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jun 2022 02:39:33 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C132A3465F
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jun 2022 23:39:23 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 32D0F1FA42;
        Wed, 22 Jun 2022 06:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1655879962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bG1rwmHkKhmMIOyk4ewu6NNHBTrpRSgP6LhymiIuEA8=;
        b=iPX4fawsAI9vWXN5lAbdqYwgEfT+Lvx2hvZj4B+2Cr1BJmxIyxZG3pJT3vgerYb8a7MzLj
        Kn9pReOh3jqoLSdVwCh0nmUuSg4ZAnF9E6DeJwseAo0R7jclFcWSrWxjQ5zPTKdufvtjZX
        ceC0SVEJcEosQJLoQ52SJzQa8uTyhPw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1655879962;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bG1rwmHkKhmMIOyk4ewu6NNHBTrpRSgP6LhymiIuEA8=;
        b=KL2l5Kb4YL9VIvPPQB7xoBGr+NB/w5kftFU4dh0x8BfglPdfkMt5/abYELGJh7ebaa+r5T
        Y5YG1JfKEygvqmBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFC9F134A9;
        Wed, 22 Jun 2022 06:39:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 2Qn+OBm5smLZUAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 22 Jun 2022 06:39:21 +0000
Date:   Wed, 22 Jun 2022 08:39:21 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     Yi Zhang <yi.zhang@redhat.com>, linux-i2c@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [bug report] kmemleak from driver i2c_piix4
Message-ID: <20220622083921.69c9f359@endymion.delvare>
In-Reply-To: <0ce578ba-cdc7-6084-6119-10170d5e80a1@amd.com>
References: <CAHj4cs_NnJLYwhxPvDGnu4QFwS_XbgeJ7b2jOcDvBM3F+w7z0w@mail.gmail.com>
        <20220617093818.37a721a3@endymion.delvare>
        <CAHj4cs9d+j-Dc+wKK-gat3E0McZ5+2DqQhESYitSrS8Wr4s2YA@mail.gmail.com>
        <20220621144822.1d9228de@endymion.delvare>
        <0ce578ba-cdc7-6084-6119-10170d5e80a1@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Terry,

On Tue, 21 Jun 2022 09:29:44 -0500, Terry Bowman wrote:
> On 6/21/22 07:48, Jean Delvare wrote:
> 
> > Yi Zhang, can you please test this patch and confirm that it solves the
> > memory leak?
> > 
> > Terry, please review/comment.
> > 
> > If my analysis is correct then the sp5100_wdt and thinkpad_acpi drivers
> > suffer from a similar leak and need to be fixed the same way.
> 
> Your analysis is correct. The kfree() call is missing during the release in i2c-piix4 and 
> sp5100_tco driver patches. Let me know if there is anything I can do.

I've submitted patches for the 3 drivers. They are pretty
straightforward, but anything you'd be able to review or test would be
welcome.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
