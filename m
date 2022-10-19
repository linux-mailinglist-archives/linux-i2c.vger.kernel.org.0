Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D64E604E5B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 19:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbiJSRPx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 13:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbiJSRPv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 13:15:51 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7042F1870BA;
        Wed, 19 Oct 2022 10:15:48 -0700 (PDT)
Received: from darkstar.musicnaut.iki.fi (85-76-8-144-nat.elisa-mobile.fi [85.76.8.144])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: aaro.koskinen)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id A5DA31B001E6;
        Wed, 19 Oct 2022 20:15:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1666199743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TSB27Tf8QHv29rBUDBVyWDp6CrT+oI1l+W3gXR400Rw=;
        b=jCcg0+5Gi/s/Tq/DvfLwd6NtkzWtFztk5XMEV6LVX7UaTuCzpG5BToaynAzhl1sYUozH0J
        72QSel4vZYr9fXtzdOP2P+Nc1wXDtHlnS5ETpY0RcQ5FQN7PA/lg83EsQhSga3lpL3rtIa
        KaGcFEeT9xWKAJ2nF0mV/3uNrj4V0dxefToCks5d7tX1iJ9w5v7ct6XMoNrLnwTyIN7B5d
        cqbr5zq+UzD+VkKH4G5DFG5K0pfQG/4tvkZms+I4JdFlsyUDaz0fvGkFptyJXR9fbGpitu
        esHtw5sKIkvq4oRYvxDV9JRLyl0QtrIF3EnqFmSA5YyEQdKnpIHnvFYkkD1nig==
Date:   Wed, 19 Oct 2022 20:15:41 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-omap@vger.kernel.org,
        Lee Jones <lee@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 13/17] ARM: omap1: remove unused board files
Message-ID: <20221019171541.GA41568@darkstar.musicnaut.iki.fi>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-13-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019150410.3851944-13-arnd@kernel.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1666199743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TSB27Tf8QHv29rBUDBVyWDp6CrT+oI1l+W3gXR400Rw=;
        b=t96tYU74SBL18wLGdEQRBPypTNODOFUa0vFMsT6s/BwTDJWcAVvKBeTCew1ZS5l9meYE+y
        OOvA3eo3xO77Mw6bzASy7T/tu4McwQv99/f+XAtQE3xkIMnkR97YflEAp1nrAMltcxSYb/
        YhLilgFoCZdq4zBmR2bFHQIzgVTHp9bUEIqyKFKZA9gAJc31CnkG6bxa9Q8150i7Smvojr
        ojojEepxGohtCDLeelVMynZKEwcrxiEK+agmZUewHXlRmfHZSNO1qJ7h4EOL8iQ0vChRxE
        3q/qiWadevd8l/PGBHyGdh9qcSQb7MSTK0ugcrA2/ePzuYO5gK3ny/Hi9qmHNg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1666199743; a=rsa-sha256;
        cv=none;
        b=qaMDQk5N8s/18oJBz+0yG6EHKvdkAl53nptrdqk+BX9INxrWVl3Pn4RnFvxrRePHyKLudL
        STkHZP04CVtR8pG65vTzPJkdgZycPCr81LCY5YgiQlZfjhkfr4SMZmzwlo5fo39JpEJZkl
        z5X/ePqYjtQm9N61AZ6weO+rAf2o+vUc0UlX/CtQheqj0pbefDUZGHqiI8L9C758+5TQ2p
        HaHcrQrVMEH4awi7axzI4taDaTwtvaIiwQJDHZG+MOOd6caX85ltRpctl+s6gI40Bi4H2w
        GFEd7GMBJa1RnLyaDdmMlODrZXsa641Om7Ese/sPnnjKpYpr6dK9KhUr4nH9KA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Wed, Oct 19, 2022 at 05:03:35PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All board support that was marked as 'unused' earlier can
> now be removed, leaving the five machines that that still
> had someone using them in 2022, or that are supported in
> qemu.
[...]
>  config OMAP_OSK_MISTRAL
>  	bool "Mistral QVGA board Support"
>  	depends on MACH_OMAP_OSK
> -	depends on UNUSED_BOARD_FILES
>  	help
>  	  The OSK supports an optional add-on board with a Quarter-VGA
>  	  touchscreen, PDA-ish buttons, a resume button, bicolor LED,
>  	  and camera connector.  Say Y here if you have this board.

Shouldn't this go away as well?

A.
