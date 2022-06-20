Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8783551565
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jun 2022 12:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240936AbiFTKIp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jun 2022 06:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241058AbiFTKIj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jun 2022 06:08:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3C8E58;
        Mon, 20 Jun 2022 03:08:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D18B8B80E35;
        Mon, 20 Jun 2022 10:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CE0C3411B;
        Mon, 20 Jun 2022 10:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655719716;
        bh=eNZvHO7yKnCScUahO1uTGiL1HxXPdv+6WOm/54TN7SQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SjTSvdQIc6ZEHBrb4ScsHNZguKRYTsq65soWlcVBeq3dPA0+TctoKOvzCczsq6a67
         XWpVguOOuztFlP7kT8yfw8m4kmmLdc5CwqNnr6m9JgDdfPbW0fYWOBGKrJFePQvXo3
         0JWrEgCJgxb4p7+QrzNccV6HOVA/0esRAw3MQD0ZqkeJxIGc/LWw6LO7rAdwHPSc5P
         z62hKxTTATm17AxDXmKMp7RQkluD9TW11bKV5g4MFSfz9sLO5CkGJcFmTg6cfvJcA4
         jdijNnULEJQLhlmK6xEQqquYJSGSJHwZa9CJ6mlJgirdg9vxjIvBngZ7dhCOlsY5yF
         +hK5qAv4KmVtQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o3EKe-0008Gs-Vf; Mon, 20 Jun 2022 12:08:33 +0200
Date:   Mon, 20 Jun 2022 12:08:32 +0200
From:   Johan Hovold <johan@kernel.org>
To:     frank zago <frank@zago.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, linux-usb@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 0/4] add driver for the WCH CH341 in I2C/GPIO mode
Message-ID: <YrBHIDWX5EPmnpl5@hovoldconsulting.com>
References: <20220616013747.126051-1-frank@zago.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616013747.126051-1-frank@zago.net>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 15, 2022 at 08:37:43PM -0500, frank zago wrote:
> The CH341 is a multifunction chip, presenting 3 different USB PID. One
> of these functions is for I2C/SPI/GPIO. This new set of drivers will
> manage I2C and GPIO.
> 
> Changes from v5:
> Addressed reviewers' comments.

Please be more specific in your changelogs. This essentially just says
"changed stuff".

> Better handling of 0-bytes i2c commands
> Use of better USB API.

What does this even mean?

Johan
