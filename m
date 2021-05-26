Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8458390DB7
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 03:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbhEZBES (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 21:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbhEZBES (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 21:04:18 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0397C061574;
        Tue, 25 May 2021 18:02:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FqXjx4gnZz9sRN;
        Wed, 26 May 2021 11:02:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1621990965;
        bh=rx1tm0TLPgtBFnBfSkDH7Uwyg2ciXNNEGytx0IeGM+M=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=nJAwQcEuq3pWOkzumB+pjJtT4iRoZolBsMBlfJpv8WuZyOdDa+nPMC7Ydu+MKq2OQ
         vUdNIt8hhT7t7zwKHH9PsDwj36hSW9ZK7mXBoC4fNFSfL33cg5MTbdtFsFJ+emqgcF
         /AwNRvIkACY6YdDkSp+TFEYs6EkFojMe7JxcpkO7DFWwGheVGt/VHGNOsDxcL1S1Il
         ARCF9xXCRx/DKEUmqTo/Kt9oN8A+Xz0EqTgsRkuLL+SosEEiDwjQz/QJ2CIQqBqo10
         mrzeGh/MwckVdewII2oY5pRXo0wqgQ7Wvwtr1icTRkzarbM5OQpVQj8CWDRoGAOwju
         1hVyI5KJotMBw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     andriy.shevchenko@linux.intel.com, andy.shevchenko@gmail.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
In-Reply-To: <YK1HqE+3ILtGXZ7E@kunai>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
 <YK1HqE+3ILtGXZ7E@kunai>
Date:   Wed, 26 May 2021 11:02:45 +1000
Message-ID: <87zgwigvd6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram Sang <wsa@kernel.org> writes:
> On Wed, May 12, 2021 at 09:20:48AM +1200, Chris Packham wrote:
>> The P2040/P2041 has an erratum where the i2c recovery scheme
>> documented in the reference manual (and currently implemented
>> in the i2c-mpc.c driver) does not work. The errata document
>> provides an alternative that does work. This series implements
>> that alternative and uses a property in the devicetree to
>> decide when the alternative mechanism is needed.
>
> The series looks good to me. Usually, I don't take DTS patches. This
> time I'd make an exception and apply all patches to for-current because
> this is clearly a bugfix. For that, I'd need an ack from PPC
> maintainers. Could I have those for patches 2+3?

Yep, done.

cheers
