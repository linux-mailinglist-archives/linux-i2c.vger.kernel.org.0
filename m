Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3493F132E82
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 19:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgAGScy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 13:32:54 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36484 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727925AbgAGScy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 13:32:54 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so585775wru.3;
        Tue, 07 Jan 2020 10:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=9rUb//wruX/PB3VMyS1Pm9EFxT4vC3jruLB5BaMw4AA=;
        b=U7PiWz1dhOity7JtewGh+kA6b171KSeF+f4TsOl/3aGPyTrcklmpup9Mjb1QYAkXyE
         9NmZjBrof9L/C8Fee0ak6XXBT7eC30C2k8LT6Spvpcd12gwaSMgkkIKBy9K4r7yLarDK
         HF0CS2ZJF27yzhZ4NMP3gEirELZ5sptnvhYDZno5E5GHG5qD9Cq+bc2Fprt+zrAMtuzi
         mpUZP3/7ZQ1q5SzFxdEdJC/lN0jzBQpZnoXT0uC/0pLeOzZLHsfHO+jRdeAB9aDcIl0J
         5QSJyQeB4ef1tiV8ctw3Z6llBjPNUpqDguRf3J4cM72I3SiX1GTtVLo3o/7RMJcoe/K9
         1CPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=9rUb//wruX/PB3VMyS1Pm9EFxT4vC3jruLB5BaMw4AA=;
        b=A3vbsyoYBsTlLEeFWx9ezVo1iIiBQJ675GChex/Yw0WvoQbHFBPWo/t4j91d8J1mWW
         xtM7gR2W1ML8XuwGc1XxiWq/j7+LdDk82WADTVr6uwzQx69vPJJj08IqSzxkhMF3woA8
         v+i2DQsUA8+G2SeHOXVRL2IvobUbLWqADN4xMb7gcU4hTOKzthvnAg2J4w3UcRrfjpGq
         6BStENIQXLqWJ7YbEYa2xsmmCYrif5Rk7HLdLoqcHVQoaM0239Vyh11H/xeZCi/Jn5fU
         fNs6Y4muNw6ltKHRX7YzV0UxGm+3hpd+Xd7VNLBRVHZIdayp7TKmliPa36pFqwYxwYbj
         l+NA==
X-Gm-Message-State: APjAAAUlNVg1PdrytCTl4iS+C30IBlO4A1dyKSD9l/9VQCN6xJgigIsp
        quEnHnNCR4AlZgpCAdZPWAh0hLQI
X-Google-Smtp-Source: APXvYqyyGK9YIuqCIQZXVWfTT0UHxgqa4A6ZbpvORQgkIz5E4dv6EIaXr340vnSbordut5Y5FhEXSg==
X-Received: by 2002:a5d:4651:: with SMTP id j17mr420989wrs.237.1578421971891;
        Tue, 07 Jan 2020 10:32:51 -0800 (PST)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id i5sm532246wml.31.2020.01.07.10.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 10:32:51 -0800 (PST)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1iotes-0003GA-Gq; Tue, 07 Jan 2020 19:32:50 +0100
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/12] i2c: ocores: convert to use i2c_new_client_device()
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
        <20200107174748.9616-5-wsa+renesas@sang-engineering.com>
Date:   Tue, 07 Jan 2020 19:32:50 +0100
In-Reply-To: <20200107174748.9616-5-wsa+renesas@sang-engineering.com> (Wolfram
        Sang's message of "Tue, 7 Jan 2020 18:47:38 +0100")
Message-ID: <87muazjewd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Wolfram" == Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

 > Move away from the deprecated API and return the shiny new ERRPTR where
 > useful.

 > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I didn't follow the discussion, but I don't see any returns anywhere?

 > ---
 > Build tested only.

 >  drivers/i2c/busses/i2c-ocores.c | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
 > index ca8b3ecfa93d..f5fc75b65a19 100644
 > --- a/drivers/i2c/busses/i2c-ocores.c
 > +++ b/drivers/i2c/busses/i2c-ocores.c
 > @@ -731,7 +731,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 >  	/* add in known devices to the bus */
 >  	if (pdata) {
 >  		for (i = 0; i < pdata->num_devices; i++)
 > -			i2c_new_device(&i2c->adap, pdata->devices + i);
 > +			i2c_new_client_device(&i2c->adap, pdata->devices + i);
 >  	}
 
 >  	return 0;
 > -- 
 > 2.20.1


-- 
Bye, Peter Korsgaard
