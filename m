Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17DB254482E
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 12:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbiFIKAt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 06:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232459AbiFIKAs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 06:00:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F4E196A99
        for <linux-i2c@vger.kernel.org>; Thu,  9 Jun 2022 03:00:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 88069B82C88
        for <linux-i2c@vger.kernel.org>; Thu,  9 Jun 2022 10:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B601BC34114;
        Thu,  9 Jun 2022 10:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1654768844;
        bh=wtZcywVyXSmXuqhMGn6M67mfvP6l4Xq2Yq+eYTX6618=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C7ScrcM/QAeopfZ6hJD6OJhnQ6CRiZxvjbZpkSOEXz1ZgyRNJ3KReKyrk7aR374MK
         QuEZXwkkTeLYwc95/hQIbhpjumaxwkrxJKyQovuG72g8sH/d6T0aRjJ06b2oTHCxU+
         5zlHO5wWSvm9CqO9LtmNf0tAX4vVIawc8Bgm+v7Y=
Date:   Thu, 9 Jun 2022 12:00:41 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: i2c: Make remove callback return void
Message-ID: <YqHEyYVYjM8F262P@kroah.com>
References: <20220609091018.q52fhowlsdbdkct5@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609091018.q52fhowlsdbdkct5@pengutronix.de>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 09, 2022 at 11:10:18AM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> I intend to send a patch that does 
> 
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index fbda5ada2afc..066b541a0d5d 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -273,7 +273,7 @@ struct i2c_driver {
>  
>  	/* Standard driver model interfaces */
>  	int (*probe)(struct i2c_client *client, const struct i2c_device_id *id);
> -	int (*remove)(struct i2c_client *client);
> +	void (*remove)(struct i2c_client *client);
>  
>  	/* New driver model interface to aid the seamless removal of the
>  	 * current probe()'s, more commonly unused than used second parameter.
> 
> and adapts all users accordingly once 5.20-rc1 (assuming Linus will be
> able to count to 20 for 5.x :-) is out. The rationale is that returning
> an error code doesn't make a relevant difference. The only effect is
> that the i2c core emits a generic error message and still removes the
> device.
> 
> To make this adaption of drivers easily reviewable, I created quite a
> few patches to make all drivers always return zero in their remove
> callback---so the adaption just drops "return 0" (or replaces them by
> "return").
> Most of them are already in Linus's tree, but some others (currently 18
> as of next-20220608) are still in next and another bunch wasn't
> processed by the respective maintainers yet (in a public way at least;
> currently 15).
> 
> The tree with my current work-in-progress is available at
> 
> 	https://git.pengutronix.de/git/ukl/linux i2c-remove-void
> 
> I intend to rebase that to the following -rc releases and adapt to
> relevant changes there. Currently this tree is successfully build-tested
> using allmodconfig on arm64, m68k, powerpc, riscv, s390, sparc64 and
> x86_64. The current shortstat is:
> 
> 	 633 files changed, 732 insertions(+), 1803 deletions(-)
> 
> Assuming you agree to this quest, it would be great if you accepted the
> change (+ the then maybe still non-accepted driver changes) in the i2c
> tree exposing them early after 5.20-rc1 in next. Maybe it will be
> sensible to then create a signed tag for these changes to allow other
> affected maintainers to pull this change into their trees.
> 
> For now this is just a note to let you know in advance of my plans. If
> you have concerns or alternative suggestions for the next steps or their
> timing, please let me know.

No objection from me!
