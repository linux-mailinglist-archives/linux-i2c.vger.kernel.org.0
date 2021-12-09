Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4FA46E8C2
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 14:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233267AbhLINHy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 08:07:54 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:34730 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237546AbhLINHy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 08:07:54 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 53CF2210FF;
        Thu,  9 Dec 2021 13:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1639055060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K4FGzQTy/inMrm50HLOgNtodXn7PnHkxbDoUCYFw+6g=;
        b=NlntPKO5R9LdT/WEjT21/U60BIPeOK+qJvIRl0CYCxSllAMKdgehIJboihh9wxGKfcYb+X
        01qOogNBy8lfrgcrToN2dqg97ne1XUyqogXkFCunviiJjFFl76mDYVRJ4xeFql7y6yyPz9
        KXxJArxpmgRqjnC2gj5436+9helwmaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1639055060;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K4FGzQTy/inMrm50HLOgNtodXn7PnHkxbDoUCYFw+6g=;
        b=llUeuwvzFld5LYjJ89l2+KmOHhz7usObnhaORHC7/WI//k8T+cx/hAOJWwOtRAl1pRW6TU
        5EiW9yh1h7BySECg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F6DB13B2D;
        Thu,  9 Dec 2021 13:04:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id hg5nBdT+sWEjdgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 09 Dec 2021 13:04:20 +0000
Date:   Thu, 9 Dec 2021 14:04:18 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Don't read back cleared status in
 i801_check_pre()
Message-ID: <20211209140418.253f5f51@endymion>
In-Reply-To: <YbHJfUk14INERHEB@ninjato>
References: <f0d7dd91-5b35-d5bb-33b7-dacc632c542a@gmail.com>
        <20211203105914.393ffd24@endymion>
        <31f34ce9-bf1f-29fc-a2c1-6ad549b5dd16@gmail.com>
        <20211207151443.362c89a2@endymion>
        <YbHJfUk14INERHEB@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 9 Dec 2021 10:16:45 +0100, Wolfram Sang wrote:
> > As I got some time to think about it, answering myself: I'm fine
> > removing the checks. If we ever hit the problem (unable to clear the
> > error flags), it means that something went wrong _before_, and we must
> > have logged these problems already. As a matter of fact, that was
> > exactly the situation for Felix, the message you want to remove was the
> > 4th error message logged, so in fact it did not really add any value.  
> 
> May I read this as an ack?

Yes, sorry ^^

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
