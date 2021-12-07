Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C0A46B225
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 06:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233005AbhLGFVc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 00:21:32 -0500
Received: from fallback24.m.smailru.net ([94.100.187.223]:49108 "EHLO
        fallback24.mail.ru" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232346AbhLGFVc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Dec 2021 00:21:32 -0500
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Dec 2021 00:21:31 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail3;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=QG2ytub1ij7EOEbMVwiaQ+04EzlU6e1LmIOMQW3NCoE=;
        t=1638854282;x=1639459682; 
        b=AD7GO6YhuH0F9Igk5bVR2HPHiwu3VExmeCzLXswEmehUzOZoxM/EJHtEKphQs2PzYkewKE6L+ruG5VlrMKHIxccyM498naRYHmQJEflePDRTyEsq7p+ot31kA404nTeJetpuxFWP47UE9JTfUEKjY25h/5rGSt6IDB57qfx73Bs=;
Received: from [10.161.55.49] (port=39000 helo=smtpng1.i.mail.ru)
        by fallback24.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
        id 1muSli-0000Mb-KI
        for linux-i2c@vger.kernel.org; Tue, 07 Dec 2021 08:11:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=QG2ytub1ij7EOEbMVwiaQ+04EzlU6e1LmIOMQW3NCoE=;
        t=1638853918;x=1639459318; 
        b=ZxK0bVWqOxJ2p00LnWl1aPRrxf5N8vnsnwITJPzF6+11dxCFwfmqBZO8HKDFvgwHhWdfg62B+iqFYCHCb+VPNNkWO6PU2FGq/otR2YzgTaO4Xds0jmrnWhNZi9d/zFIU3iq+MezKnKL3Lk1NdUWOY3gIXRht9Iuqz6ykQL9pxwVH/syB9MKhrjJMvjyrJu77dIIeqGVJrRCRUIKZ8EK0iRML4ML2+5cgsxEHw0VrG2HETKBTRRgUosAvaSAf9MdbnhNOfLMBq32MAUqXY4rmMVoHJrr/kI2GDLsI9d1VmJpsf07FV5S/cFGoPfmpx5SGHq5L71PpPLpYHdYZND/Jiw==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from <fido_max@inbox.ru>)
        id 1muSlc-0005vq-LL; Tue, 07 Dec 2021 08:11:53 +0300
Message-ID: <2e031f3e-7fd1-70f2-e9aa-15c7bd50d36d@inbox.ru>
Date:   Tue, 7 Dec 2021 08:11:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] eeprom: at24: Add support for 24c1025 EEPROM
Content-Language: en-US
To:     linux-i2c@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     brgl@bgdev.pl, arnd@arndb.de, gregkh@linuxfoundation.org
References: <20211203223727.62984-1-fido_max@inbox.ru>
From:   Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20211203223727.62984-1-fido_max@inbox.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD99F281DB1F96F126DCA22A202AEF78EF159E19FA1AE78C11C00894C459B0CD1B93148D5FC4D0A4202AB91B417E7B13D810955EA9A531C28E120A750D03C7D9B38
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DDEA16837FFA1F5BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372E9841F416E2DCCD8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8213E77143E763046A25235BFA45DEE886F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7ABB305BD10C6E5099FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B292D688DDAD4E7BC389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735F43AACC0BCEB2632C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A51117BB71D1990F71378AC788E67E1A2E7732C286E7AF3E88D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA752546FE575EB473F1410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34F7CC4EA888783AE048D432325C9870F6C5439073196DFE1F470EA295224B25DA5D3ECCAC20E7EC5E1D7E09C32AA3244C568F5F63EC3C2D426EEF5A5490719ACD24AF4FAF06DA24FD83B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojTrkTMKMUi4VVGs2P1ri45A==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5D47F887E59609E8D92D69E92C5F4A0B8998CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4297D9AD4AAE60BCB73DCF6C1D8861912E367BFF1CF8D0418049FFFDB7839CE9E5B34ED26680E15DA57444A6DB682D3EF743FFFF0F3B3A451379E0A9F943860E7
X-7FA49CB5: 0D63561A33F958A512BC5D71C052C531CB5EEF9BAAECB356A8FEB8289D235A6FCACD7DF95DA8FC8BD5E8D9A59859A8B6A183FDCE24978B01CC7F00164DA146DAFE8445B8C89999728AA50765F7900637BA2F0AEB80054583389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC84E7D9683544204AFF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE778B471BB9634AD8A731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A512BC5D71C052C531CB5EEF9BAAECB35695A705393E3E0CB4D59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojTrkTMKMUi4XGlsqJ6FFu6Q==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C900538CFDDA562D7B4DABA950A8B1046AF5416508A3480420E74969E2E46225A0E24C099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CC77752E0C033A69E3453F38A29522196
X-Mras: Ok
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 04.12.2021 01:37, Maxim Kochetkov wrote:
> Microchip EEPROM 24xx1025 is like a 24c1024. The only difference
> between them is that the I2C address bit used to select between the
> two banks is bit 2 for the 1025 and not bit 0 as in the 1024.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Adding Bartosz' new email to CC...

> ---
> v2: rebased on git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/at24/for-next
> 
>   drivers/misc/eeprom/at24.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 4d91c71c42cd..633e1cf08d6e 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -91,6 +91,7 @@ struct at24_data {
>   	 * Some chips tie up multiple I2C addresses; dummy devices reserve
>   	 * them for us.
>   	 */
> +	u8 bank_addr_shift;
>   	struct regmap *client_regmaps[];
>   };
>   
> @@ -118,6 +119,7 @@ MODULE_PARM_DESC(at24_write_timeout, "Time (in ms) to try writes (default 25)");
>   struct at24_chip_data {
>   	u32 byte_len;
>   	u8 flags;
> +	u8 bank_addr_shift;
>   	void (*read_post)(unsigned int off, char *buf, size_t count);
>   };
>   
> @@ -132,6 +134,12 @@ struct at24_chip_data {
>   		.read_post = _read_post,				\
>   	}
>   
> +#define AT24_CHIP_DATA_BS(_name, _len, _flags, _bank_addr_shift)	\
> +	static const struct at24_chip_data _name = {			\
> +		.byte_len = _len, .flags = _flags,			\
> +		.bank_addr_shift = _bank_addr_shift			\
> +	}
> +
>   static void at24_read_post_vaio(unsigned int off, char *buf, size_t count)
>   {
>   	int i;
> @@ -192,6 +200,7 @@ AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16);
>   AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
>   AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
>   AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
> +AT24_CHIP_DATA_BS(at24_data_24c1025, 1048576 / 8, AT24_FLAG_ADDR16, 2);
>   AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16);
>   /* identical to 24c08 ? */
>   AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0);
> @@ -220,6 +229,7 @@ static const struct i2c_device_id at24_ids[] = {
>   	{ "24c256",	(kernel_ulong_t)&at24_data_24c256 },
>   	{ "24c512",	(kernel_ulong_t)&at24_data_24c512 },
>   	{ "24c1024",	(kernel_ulong_t)&at24_data_24c1024 },
> +	{ "24c1025",	(kernel_ulong_t)&at24_data_24c1025 },
>   	{ "24c2048",    (kernel_ulong_t)&at24_data_24c2048 },
>   	{ "at24",	0 },
>   	{ /* END OF LIST */ }
> @@ -249,6 +259,7 @@ static const struct of_device_id at24_of_match[] = {
>   	{ .compatible = "atmel,24c256",		.data = &at24_data_24c256 },
>   	{ .compatible = "atmel,24c512",		.data = &at24_data_24c512 },
>   	{ .compatible = "atmel,24c1024",	.data = &at24_data_24c1024 },
> +	{ .compatible = "atmel,24c1025",	.data = &at24_data_24c1025 },
>   	{ .compatible = "atmel,24c2048",	.data = &at24_data_24c2048 },
>   	{ /* END OF LIST */ },
>   };
> @@ -533,7 +544,8 @@ static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
>   
>   	dummy_client = devm_i2c_new_dummy_device(&base_client->dev,
>   						 base_client->adapter,
> -						 base_client->addr + index);
> +						 base_client->addr +
> +						 (index << at24->bank_addr_shift));
>   	if (IS_ERR(dummy_client))
>   		return PTR_ERR(dummy_client);
>   
> @@ -674,6 +686,7 @@ static int at24_probe(struct i2c_client *client)
>   	at24->page_size = page_size;
>   	at24->flags = flags;
>   	at24->read_post = cdata->read_post;
> +	at24->bank_addr_shift = cdata->bank_addr_shift;
>   	at24->num_addresses = num_addresses;
>   	at24->offset_adj = at24_get_offset_adj(flags, byte_len);
>   	at24->client_regmaps[0] = regmap;
