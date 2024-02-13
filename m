Return-Path: <linux-i2c+bounces-1692-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DE8852EC0
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 12:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90BBB1F261A0
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 11:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156F22BB11;
	Tue, 13 Feb 2024 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jRUB4weo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vEcezAlF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jRUB4weo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vEcezAlF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3957134D8
	for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 11:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707822365; cv=none; b=Z/f1iYy6DByFyyEuhDSeBPyTgFtqj4HTybC7z/uLnHuRwuA+u7qFP0sWOvdYDB8VAHVAO2jEv1ljVblPCl771HqRK71ZoGXgr+8jwx1JIWUgvLQMRM5GWfVOKLHx6Jp8NnKX+npf7vgruLzZ+yQc9lFFB6FJLh8tJSKtPzVHP2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707822365; c=relaxed/simple;
	bh=Gj/J9IFeN83+SBaXS7XlD/Qdcoc+iOUVweW5mM+BRHI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YtDnhGJuXuCyPf6e4O6RwFCON1lTTj564jJoDE+h6dpA6WHGUog7kIfRIyirU42UGK6UVljyy8FZM0lauX76/QtiUjiNtx+ni04jNuT9qcZ99EyxEAId00Au5NfDGJfI2ebLQFqM2oMciinKWBVQHSq3f24E9zE749nZjGjksUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jRUB4weo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vEcezAlF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jRUB4weo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vEcezAlF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E04521FC81;
	Tue, 13 Feb 2024 11:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707822359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoSy4dC+xhBgrGUCyLVjBhk1s/2UJ6mPQQVulfsbOtI=;
	b=jRUB4weob/6VDe327tFwlDyqesDbilILIc8k6zG4ZM46i4GbbMBSXfk/ZnSDu1cqT0EPuk
	oNwxejTwRG9+k1V8DkhYflexWOZK5s3q9koKMJ1Q3ObTIu+/SnHpExiWCVO3RJnSCzl5ra
	dOzej/OhZL4VmC+H7xnwcnjTtuywLG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707822359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoSy4dC+xhBgrGUCyLVjBhk1s/2UJ6mPQQVulfsbOtI=;
	b=vEcezAlFCOK/3801ESj8bPk5IQHSKZbMyjNKIjOwnA8L6kBU8jyd+WC5VJ+LnPE+XXR7QV
	Bjum4292hcRrFaDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707822359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoSy4dC+xhBgrGUCyLVjBhk1s/2UJ6mPQQVulfsbOtI=;
	b=jRUB4weob/6VDe327tFwlDyqesDbilILIc8k6zG4ZM46i4GbbMBSXfk/ZnSDu1cqT0EPuk
	oNwxejTwRG9+k1V8DkhYflexWOZK5s3q9koKMJ1Q3ObTIu+/SnHpExiWCVO3RJnSCzl5ra
	dOzej/OhZL4VmC+H7xnwcnjTtuywLG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707822359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoSy4dC+xhBgrGUCyLVjBhk1s/2UJ6mPQQVulfsbOtI=;
	b=vEcezAlFCOK/3801ESj8bPk5IQHSKZbMyjNKIjOwnA8L6kBU8jyd+WC5VJ+LnPE+XXR7QV
	Bjum4292hcRrFaDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8D5E13404;
	Tue, 13 Feb 2024 11:05:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uClcJhZNy2XLcgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 13 Feb 2024 11:05:58 +0000
Date: Tue, 13 Feb 2024 12:05:53 +0100
From: Jean Delvare <jdelvare@suse.de>
To: "Zakowski, Piotr" <piotr.zakowski@intel.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, "Shepon, Oren"
 <oren.shepon@intel.com>, "Kozlowski, Pawel" <pawel.kozlowski@intel.com>,
 "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Radtke, Jakub"
 <jakub.radtke@intel.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: Potential bug in SMBus kernel module
Message-ID: <20240213120553.7b0ab120@endymion.delvare>
In-Reply-To: <SJ0PR11MB5133C098821363F292316A0088482@SJ0PR11MB5133.namprd11.prod.outlook.com>
References: <SJ0PR11MB5133C098821363F292316A0088482@SJ0PR11MB5133.namprd11.prod.outlook.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.60 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,intel.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.60

Hi Piotr,

Thanks for your bug report.

On Mon, 12 Feb 2024 12:44:35 +0000, Zakowski, Piotr wrote:
> 4. Observed bug
>=20
> In the "Block Write-Block Read Process Call", the FIFO index should be cl=
eared twice.
> Testing of the Linux driver for the above scenario has shown that it only=
 clears once during the write part (writing data to the FIFO buffer) and do=
es not clear before the read part (reading data from the FIFO buffer).
> As a result, the command only returns a portion of the data (N-M) and lea=
ves behind residual data from previous SMBus commands that used the FIFO bu=
ffer.

Support for the Block Write-Block Read Process Call command was added
to the i2c-i801 driver by Alexander Sverdlin in June 2019. I'm adding
him to Cc, but he changed addresses meanwhile, so I hope I got the
right Alexander.

The i2c-i801 driver received a lot of changes meanwhile, however as far
as I can see this implementation detail did not change, the data buffer
index is still only reset once at the beginning of
i801_block_transaction_by_block(), as it was back then.

Alexander, back when you contributed the code, you said the new command
was long-time tested, so it's hard to believe it includes the bug
reported by Piotr. Do you remember which Intel chipset you were using?
Is the code you submitted exactly what you were using on the hardware,
or is there a chance that you forgot one change when preparing the
upstream submission?

Piotr, which Intel chipset have you been testing? Is there a chance
that different Intel chipsets may behave differently in this respect?
Out of curiosity, how are you testing the Block Write-Block Read
Process Call command? Very few target devices support this command.

I looked at the ICH9 datasheet (Intel document number 316972-002) and
in the description of the "Block Write=E2=80=93Block Read Process Call" com=
mand
protocol (section 5.20.1.1, page 217) it is clearly stated:

  "Software must do a read to the command register (offset 2h) to reset
  the 32 byte buffer pointer prior to reading the block data register."

So I guess the driver should indeed be doing that. But I'd really like
to understand how this went unnoticed so far.

--=20
Jean Delvare
SUSE L3 Support

